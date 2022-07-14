// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../ui/pages/general/general_screen.dart' as _i3;
import '../ui/pages/info/info_screen.dart' as _i2;
import '../ui/pages/splash/splash_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    InfoScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.InfoScreen());
    },
    GeneralScreenRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.GeneralScreen(),
          transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1200,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i4.RouteConfig(InfoScreenRoute.name, path: '/info-screen'),
        _i4.RouteConfig(GeneralScreenRoute.name, path: '/general-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.InfoScreen]
class InfoScreenRoute extends _i4.PageRouteInfo<void> {
  const InfoScreenRoute() : super(InfoScreenRoute.name, path: '/info-screen');

  static const String name = 'InfoScreenRoute';
}

/// generated route for
/// [_i3.GeneralScreen]
class GeneralScreenRoute extends _i4.PageRouteInfo<void> {
  const GeneralScreenRoute()
      : super(GeneralScreenRoute.name, path: '/general-screen');

  static const String name = 'GeneralScreenRoute';
}
