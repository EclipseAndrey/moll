import 'dart:async';
import 'dart:io';

import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moll/moll.dart';
import 'package:moll/support/analytic/analytic_manager/analytic_manager.dart';
import 'package:moll/support/analytic/appmetrica/appmetrica_service.dart';
import 'package:moll/support/constants/app_settings.dart';
import 'package:moll/support/crashlytics/crashlytics.dart';
import 'package:moll/firebase_options.dart';
import 'package:moll/support/proxy/proxy.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();

  /// === Network ===
  HttpOverrides.global = MollProxy(await MollProxy.getSelfSigningCertificates());

  /// Status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays:
  [SystemUiOverlay.top, SystemUiOverlay.bottom]);



  /// === Firebase ===
  if(Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Crashlytics.init();
  }


  /// === AppSettings ===
  await AppSettings().initFromLocal();


  final getIt = GetIt.instance;

  /// === Analytics ===
  getIt.registerLazySingleton<AnalyticManager>(() => AnalyticManager());

  if(Platform.isAndroid) {
    // getIt<AnalyticManager>().addPanel(AdjustService());
  }
  // getIt<AnalyticManager>().addPanel(AppMetricaService());

  await getIt<AnalyticManager>().start();

  DartPingIOS.register();

  runZonedGuarded((){
    runApp(const MollApp());
  }, (e,st){
    Crashlytics.printLog(e.toString(),stackTrace: st);
  });
}



