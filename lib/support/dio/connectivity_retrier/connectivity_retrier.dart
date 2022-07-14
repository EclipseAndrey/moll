import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:moll/support/dio/extensions/request_options_to_options.dart';
import 'package:moll/support/logger/src/common_logger.dart';


class ConnectivityRetrier {
  final Dio dio;
  final Connectivity connectivity;

  ConnectivityRetrier({
    required this.dio,
    required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions ro) async {
    late StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult != ConnectivityResult.none) {
          final options = ro.toOptions();
          responseCompleter.complete(
            dio.request(
              ro.path,
              cancelToken: ro.cancelToken,
              data: ro.data,
              onReceiveProgress: ro.onReceiveProgress,
              onSendProgress: ro.onSendProgress,
              queryParameters: ro.queryParameters,
              options: options,
            ),
          );
          L.i('Retry request');
          streamSubscription.cancel();
        }
      },
    );

    return responseCompleter.future;
  }
}
