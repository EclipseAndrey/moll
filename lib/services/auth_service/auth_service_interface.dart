import 'package:moll/models/auth/token_api.dart';
import 'package:rxdart/rxdart.dart';


abstract class AuthServiceInterface{
  Future<TokenApi> getToken(String login, String password);
  Future<TokenApi> getTokenFromCode(String code);
  Future<void> saveTokenLocal(TokenApi tokenApi);
  Future<TokenApi> getTokenLocal();
  Future<TokenApi> refreshToken({TokenApi? tokenApi});
  Future<bool> cleanToken();
}