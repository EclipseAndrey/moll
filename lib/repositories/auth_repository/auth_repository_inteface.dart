

import 'package:moll/models/auth/token_api.dart';

abstract class AuthRepositoryInterface{
  TokenApi? tokenApi;
  bool get isAuth => tokenApi != null;
  Future<bool> login(String login, String password);
  Future<bool> loginFromCode(String code);
  Future<bool> cleanData();
  Future<TokenApi> getTokenLocal();
  Future<TokenApi> refreshToken({TokenApi? tokenApi});
}