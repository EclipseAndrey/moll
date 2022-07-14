import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:moll/models/auth/boxes.dart';
import 'package:moll/models/auth/token_api.dart';
import 'package:moll/models/auth/token_api2.dart';
import 'package:moll/services/auth_service/auth_service_interface.dart';
import 'package:moll/support/constants/api_config.dart';
import 'package:moll/support/constants/shared_preferences_key_constants.dart';
import 'package:moll/support/crashlytics/crashlytics.dart';


class AuthService implements AuthServiceInterface {
  String serviceName = "AuthService";
  @override
  Future<TokenApi> getToken(String login, String password) async {
    Dio dio = Dio();
    String url = ApiConfig.endpointToken;

    Map<String, dynamic> body = Map();
    body['username'] = login;
    body['password'] = password;
    body['grant_type'] = "password";
    body['scope'] = "openid";
    body['client_id'] = "ui-auth";

    Map<String, dynamic> headers = HashMap();
    headers['Content-type'] = 'o';
    dio.options.headers = headers;

    try {
      var response = await dio.post(url,
          data: body,
          options: Options(contentType: 'application/x-www-form-urlencoded'));
      if (response.statusCode == 200) {
        TokenApi tokenApi = TokenApi.fromMap(response.data);
        await saveTokenLocal(tokenApi);

        return tokenApi;
      } else {
        Crashlytics.printLog("StatusCode = ${response.statusCode} ");
      }
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }

    throw UnimplementedError("$serviceName error getToken");
  }

  Future<TokenApi> refreshToken({TokenApi? tokenApi}) async {
    TokenApi _tokenApi;
    try {
      if (tokenApi != null) {
        _tokenApi = tokenApi;
      } else {
        _tokenApi = await getTokenLocal();
      }
    } catch (e) {
      throw UnimplementedError(
          '$serviceName error refreshToken\n=== fail getTokenLocal\n$e');
    }
    Dio dio = Dio();
    String url = ApiConfig.endpointToken;
    Map<String, dynamic> headers = HashMap();
    headers['Content-type'] = 'application/x-www-form-urlencoded';
    dio.options.headers = headers;

    Map<String, dynamic> body = Map();
    body['grant_type'] = 'refresh_token';
    body['refresh_token'] = _tokenApi.refresh_token;
    body['scope'] = "openid";
    body['client_secret'] = "";
    body['client_id'] = "ui-auth";

    try {
      var response = await dio.post(url,
          data: body,
          options: Options(contentType: 'application/x-www-form-urlencoded'));
      if (response.statusCode == 200) {
        TokenApi tokenApi = TokenApi.fromMap(response.data);
        await saveTokenLocal(tokenApi);
        return tokenApi;
      } else {
        Crashlytics.printLog("StatusCode = ${response.statusCode} ");
      }
    } on DioError catch (e) {
      throw e;
    }
    throw UnimplementedError("$serviceName error refreshToken");
  }

  Future<void> saveTokenLocal(TokenApi tokenApi) async {
    var token = TokenApi2()..tokenApi = tokenApi;
    // UserInfo userInfo = await getUserInfo(tokenApi: tokenApi);
    // updateToken.sink.add(DioDataAuth(token: tokenApi, userInfo: userInfo));
    var box = Boxes.getTokens();
    box.put(MConstants.token, token);
    token.save();
  }

  Future<TokenApi> getTokenLocal() async {
    var box = Boxes.getTokens();
    return box.get(MConstants.token)!.tokenApi;
  }

  Future<bool> cleanToken() async {
    try {
      var box = Boxes.getTokens();
      box.delete(MConstants.token);
      return true;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<TokenApi> getTokenFromCode(String code) async {

    throw UnimplementedError();
  }





}
