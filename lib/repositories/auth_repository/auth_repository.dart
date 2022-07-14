import 'package:moll/models/auth/token_api.dart';
import 'package:moll/repositories/auth_repository/auth_repository_inteface.dart';
import 'package:moll/services/auth_service/auth_service_interface.dart';
import 'package:moll/support/crashlytics/crashlytics.dart';


class AuthRepository extends AuthRepositoryInterface{
  final AuthServiceInterface authService;
  AuthRepository({
    required this.authService,
});

  @override
  Future<bool> login(String login, String password)async {
    // try{
      TokenApi _tokenApi = await authService.getToken(login, password);
      await authService.saveTokenLocal(_tokenApi);
      this.tokenApi = _tokenApi;
      return true;
    // }catch(e){
    //   return false;
    // }
  }



  @override
  Future<bool> loginFromCode(String code) async{
    try{
      TokenApi tokenApi = await authService.getTokenFromCode(code);
      this.tokenApi = tokenApi;
      await authService.saveTokenLocal(tokenApi);
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Future<bool> cleanData() async{
    try{
      await authService.cleanToken();
      tokenApi = null;
      return true;
    }catch(e){
      Crashlytics.printLog(this.runtimeType.toString()+" "+e.toString());
      return false;
    }
  }

  @override
  Future<TokenApi> getTokenLocal() async{
    TokenApi _tokenApi = await  authService.getTokenLocal();
    this.tokenApi = _tokenApi;
    return _tokenApi;
  }


  @override
  Future<TokenApi> refreshToken({TokenApi? tokenApi}) async{
    TokenApi _tokenApi = await  authService.refreshToken(tokenApi: tokenApi);
    this.tokenApi = _tokenApi;
    return _tokenApi;
  }
}