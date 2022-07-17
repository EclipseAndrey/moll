// @CupertinoAutoRouter              
// @AdaptiveAutoRouter              
// @CustomAutoRouter              
import 'package:auto_route/auto_route.dart';
import 'package:moll/ui/pages/general/general_screen.dart';
import 'package:moll/ui/pages/info/info_screen.dart';
import 'package:moll/ui/pages/scan/scan_screen.dart';
import 'package:moll/ui/pages/splash/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    CupertinoRoute(page: InfoScreen,),
    CupertinoRoute(page: ScanScreen,),
    CustomRoute(page: GeneralScreen, transitionsBuilder: TransitionsBuilders.fadeIn, durationInMilliseconds: 1200, ),
  ],
)
class $AppRouter {}