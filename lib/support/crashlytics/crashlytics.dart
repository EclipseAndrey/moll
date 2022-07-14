import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:moll/support/logger/src/common_logger.dart';



class Crashlytics{
  Crashlytics();
    // FirebaseCrashlytics.instance.crash();

  static Future init()async{
    if (kDebugMode) {
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(false);
    }
  }

  static Future printLog(String error, {StackTrace? stackTrace, bool record = true, String? reason})async{

    if (kDebugMode) {
      L.i(error.toString());
      if(stackTrace != null){
        L.i(stackTrace.toString());
      }
        // String messs = error.toString();
        // if(messs.length > 500){
        //   for(int i = 0; i < (messs.length/500).floor()+1; i++){
        //     print(messs.substring(500*i, (500*i+500).clamp(0, messs.length)));
        //     messs = messs.substring(500*i);
        //   }
        // }else{
        //   print(messs);
        // }
        // print(stackTrace.toString());
        // await FirebaseCrashlytics.instance.recordError(
        //     error,
        //     stackTrace,
        //     reason: 'a non-fatal error'
        // );

    } else if (record){
      if(Platform.isAndroid) {
        await FirebaseCrashlytics.instance.recordError(
          error,
          stackTrace,
          reason: reason ?? 'a non-fatal error',
        );
      }
    }
  }
}