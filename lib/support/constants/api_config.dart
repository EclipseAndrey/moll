
import 'package:moll/support/constants/app_settings.dart';

class ApiConfig {

  static String source() {
    Stand stand = AppSettings().stand;
    switch (stand) {
      case Stand.dev:
        return _HOST_DEV;
      case Stand.prom:
        return _HOST_PROM;
    }
  }

  //TODO HOSTS
  static const _HOST_DEV = "";
  static const _HOST_PROM = "";


  static const _HTTP = "http://";
  static const _HTTPS = "https://";


  static final main = _HTTPS + "${source()}/";


  /// ENDPOINTS

  ///Auth
  static final String endpointToken = "$main/auth/token";

  ///Profile
  static final String endpointGetUser = "$main/profile/user";
  static final String endpointUpdateUser = "$main/profile/updateUser";
  static final String endpointGetUserRoles = "$main/profile/userRoles";

  ///Banners
  static final String endpointGetBannersMain = "$main/banners/main";


}
