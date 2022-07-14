
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:moll/models/auth/token_api.dart';
import 'package:moll/repositories/auth_repository/auth_repository_inteface.dart';
import 'package:moll/support/constants/app_settings.dart';
import 'package:moll/support/crashlytics/crashlytics.dart';
import 'package:moll/support/dio/connectivity_retrier/connectivity_retrier.dart';
import 'package:moll/support/logger/src/common_logger.dart';
import 'package:moll/support/snack_bar/error.dart';
import 'package:moll/support/dio/extensions/is_auth_not_set_staus_code.dart';


class DioDataAuth{
  final TokenApi? token;
  // final UserInfo? userInfo;
  DioDataAuth({
   required this. token,
});
}


class DioFactory {

  final AuthRepositoryInterface authRepository;
  final Dio _dio = Dio();
  Dio dioWithoutAuth = Dio();

  Function onRefreshTokenError;

  DioFactory({
    required this.authRepository,
    required this.onRefreshTokenError
}){
    init();
  }

  Dio get dio => _dio;

  init({TokenApi? tokenApi})async{

    _dio.interceptors.addAll(
      [
        _connectionInterceptor(),
        _getRefreshTokenInterceptor(),
      ],
    );

    ///Token
    if(authRepository.tokenApi != null){
      _dio.options.headers['authorization'] = 'Bearer ${authRepository.tokenApi!.access_token}';
    }else{
      try {
        TokenApi token = await authRepository.getTokenLocal();
        _dio.options.headers['authorization'] =
        'Bearer ${authRepository.tokenApi!.access_token}';
      }catch(e){
        Crashlytics.printLog("dio error init");
      }

    }
  }

  void addHeaders(Map<String,dynamic> headers){
    _dio.options.headers..addAll(headers);
  }

  initToken()async{
    try {
      TokenApi token = await authRepository.getTokenLocal();
      _dio.options.headers['authorization'] = 'Bearer ${token.access_token}';
    }catch(e){
      Crashlytics.printLog("Dio init token error");
    }
  }


  InterceptorsWrapper _getRefreshTokenInterceptor() => InterceptorsWrapper(
    onError: _onRefreshInterceptorError,
    onRequest: _onRefreshInterceptorRequest,
  );

  InterceptorsWrapper _connectionInterceptor() => InterceptorsWrapper(
    onError: _handleConnectionError,
  );


  dynamic _onRefreshInterceptorError(
      DioError error,
      ErrorInterceptorHandler handler,
      ) async {
    /// Check [connectivityResult] and response [statusCode]
    /// for segmentation error
    final connectivityResult = await Connectivity().checkConnectivity();
    final isNotAuthException = error.response?.isNotAuthException ?? true;
    if (isNotAuthException || connectivityResult == ConnectivityResult.none) {
      handler.next(error);
      return;
    }

    final textError = json.encode(error.response?.data);
    //await CrashReportService.instance.log(textError);
    Crashlytics.printLog(textError);

    try {
      final token = (await authRepository.refreshToken()).access_token;
      dio.options.headers['authorization'] = 'Bearer $token';
      L.i('Renew token from error\nToken: ${dio.options.headers["authorization"]}');

      //Reissue a request to get data
      final request = error.requestOptions;

      await dio.request(
        request.path,
        data: request.data,
        queryParameters: request.queryParameters,
      );
    } catch (e) {
      onRefreshTokenError();
      // throw UnauthorizedServiceException();
    } finally {
      handler.next(error);
    }
  }

  dynamic _onRefreshInterceptorRequest(
      RequestOptions options,
      RequestInterceptorHandler requestInterceptorHandler,
      ) async {
    try{
      final authInfo = await authRepository.getTokenLocal();
       if (authInfo.expires_in.isBefore(DateTime.now())) {
          final token = await authRepository.refreshToken();
          dio.options.headers['authorization'] = 'Bearer ${token.access_token}';
          L.i(
            'Renew token from expire date',
          );
       }

      options.headers['authorization'] = 'Bearer ${authInfo.access_token}';
    }catch(e, st){
      L.e('Renew token exeption', e, st);
      onRefreshTokenError();
      // throw UnauthorizedServiceException();
    }

    requestInterceptorHandler.next(options);
  }

  dynamic _handleConnectionError(
      DioError err,
      ErrorInterceptorHandler handler,
      ) async {
    if (_shouldRetry(err)) {
      final connectivityRetrier = ConnectivityRetrier(
        dio: dio,
        connectivity: Connectivity(),
      );
      L.e('Not connected', err);
      showErrorSnackBar("Нет соединения", remove:  true);
      try {
        final response =
        await connectivityRetrier.scheduleRequestRetry(err.requestOptions);
        handler.resolve(response);
        L.i('Connection resolve');
      } catch (e, st) {
        L.e('Error in connectivity interceptor $e', e, st);
        return e;
      }
    }
    handler.next(err);
  }


  bool _shouldRetry(DioError err) =>
      err.error != null && err.error is SocketException;
}
