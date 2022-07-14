import 'package:dio/dio.dart';

List<int> get _authorizeStatusCodes => [401, 403];
bool _isAuthErrorStatus(int status) => _authorizeStatusCodes.contains(status);

extension ResponseStatusCodeNotSetAuth on Response {
  bool get isNotAuthException => !_isAuthErrorStatus(statusCode ?? 0);
}
