// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../ui/pages/general/general_screen.dart' as _i4;
import '../ui/pages/info/info_screen.dart' as _i2;
import '../ui/pages/scan/scan_screen.dart' as _i3;
import '../ui/pages/splash/splash_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    InfoScreenRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.InfoScreen());
    },
    ScanScreenRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.ScanScreen());
    },
    GeneralScreenRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.GeneralScreen(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1200,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i5.RouteConfig(InfoScreenRoute.name, path: '/info-screen'),
        _i5.RouteConfig(ScanScreenRoute.name, path: '/scan-screen'),
        _i5.RouteConfig(GeneralScreenRoute.name, path: '/general-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.InfoScreen]
class InfoScreenRoute extends _i5.PageRouteInfo<void> {
  const InfoScreenRoute() : super(InfoScreenRoute.name, path: '/info-screen');

  static const String name = 'InfoScreenRoute';
}

/// generated route for
/// [_i3.ScanScreen]
class ScanScreenRoute extends _i5.PageRouteInfo<void> {
  const ScanScreenRoute() : super(ScanScreenRoute.name, path: '/scan-screen');

  static const String name = 'ScanScreenRoute';
}

/// generated route for
/// [_i4.GeneralScreen]
class GeneralScreenRoute extends _i5.PageRouteInfo<void> {
  const GeneralScreenRoute()
      : super(GeneralScreenRoute.name, path: '/general-screen');

  static const String name = 'GeneralScreenRoute';
}
