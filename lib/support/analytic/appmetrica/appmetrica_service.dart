

import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:decimal/decimal.dart';
import 'package:moll/models/analytics/attribution.dart';
import 'package:moll/support/analytic/analytic_panel_interface.dart';
import 'package:moll/support/constants/analytics_events.dart';
import 'package:moll/support/constants/app_settings.dart';
import 'package:moll/support/constants/tokens.dart';

class AppMetricaService extends AnalPanel{

  @override
  Future<void> start() async{
    await AppMetrica.activate(AppMetricaConfig( (AppSettings.test)?Tokens.appmetrica_api_key_test:Tokens.appmetrica_api_key , logs: true));
  }

  @override
  Future<void> event(String event) async{
    await AppMetrica.reportEvent(event);
  }

  @override
  Future<Attribution> getAttribution<T>() {
    // TODO: implement getAttribution
    throw UnimplementedError();
  }

  @override
  Future<void> onPause() async{
    await AppMetrica.pauseSession();
  }

  @override
  Future<void> onResume() async{
    await AppMetrica.resumeSession();
  }

}
