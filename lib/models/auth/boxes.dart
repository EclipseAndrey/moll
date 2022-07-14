import 'package:hive/hive.dart';
import 'package:moll/models/auth/token_api2.dart';
import 'package:moll/support/constants/shared_preferences_key_constants.dart';


class Boxes {

  static Box<TokenApi2> getTokens() => Hive.box<TokenApi2>(MConstants.token);
}