// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../ui/pages/general/general_screen.dart' as _i5;
import '../ui/pages/host_info/host_info.dart' as _i4;
import '../ui/pages/info/info_screen.dart' as _i2;
import '../ui/pages/scan/scan_screen.dart' as _i3;
import '../ui/pages/splash/splash_screen.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    InfoScreenRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.InfoScreen());
    },
    ScanScreenRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.ScanScreen());
    },
    HostInfoScreenRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.HostInfoScreen());
    },
    GeneralScreenRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.GeneralScreen(),
          transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1200,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i6.RouteConfig(InfoScreenRoute.name, path: '/info-screen'),
        _i6.RouteConfig(ScanScreenRoute.name, path: '/scan-screen'),
        _i6.RouteConfig(HostInfoScreenRoute.name, path: '/host-info-screen'),
        _i6.RouteConfig(GeneralScreenRoute.name, path: '/general-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.InfoScreen]
class InfoScreenRoute extends _i6.PageRouteInfo<void> {
  const InfoScreenRoute() : super(InfoScreenRoute.name, path: '/info-screen');

  static const String name = 'InfoScreenRoute';
}

/// generated route for
/// [_i3.ScanScreen]
class ScanScreenRoute extends _i6.PageRouteInfo<void> {
  const ScanScreenRoute() : super(ScanScreenRoute.name, path: '/scan-screen');

  static const String name = 'ScanScreenRoute';
}

/// generated route for
/// [_i4.HostInfoScreen]
class HostInfoScreenRoute extends _i6.PageRouteInfo<void> {
  const HostInfoScreenRoute()
      : super(HostInfoScreenRoute.name, path: '/host-info-screen');

  static const String name = 'HostInfoScreenRoute';
}

/// generated route for
/// [_i5.GeneralScreen]
class GeneralScreenRoute extends _i6.PageRouteInfo<void> {
  const GeneralScreenRoute()
      : super(GeneralScreenRoute.name, path: '/general-screen');

  static const String name = 'GeneralScreenRoute';
}
