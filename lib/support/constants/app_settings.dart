import 'package:moll/support/constants/shared_preferences_key_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static final AppSettings _singleton = AppSettings._internal();
  AppSettings._internal();
  factory AppSettings() {
    return _singleton;
  }

  /// TODO

  /// Тетовые параметры
  static bool get test => true;

  /// Отключение проверки сертификатов
  static bool get disableCERTS => true;

  /// Баннеры
  bool banners = true;

  Stand _stand = Stand.prom;
  Stand get stand => _singleton._stand;

  ///
  initFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    String st = prefs.getString(MConstants.stand) ?? stringFromStand(_stand);
    _stand = standFromString(st);
  }

  initDefault() {
    banners = true;
  }

  ///Setters

  setStand(Stand stand) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(MConstants.stand, stringFromStand(stand));
    _stand = stand;
  }

  /// other

  static Stand standFromString(String string) {
    switch (string) {
      case "dev":
        return Stand.dev;
      case "prom":
        return Stand.prom;
      default:
        return Stand.dev;
    }
  }

  static String stringFromStand(Stand stand) {
    switch (stand) {
      case Stand.dev:
        return "dev";
      case Stand.prom:
        return "prom";
      default:
        return "dev";
    }
  }
}

enum Stand { dev, prom }
