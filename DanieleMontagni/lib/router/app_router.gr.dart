// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:offerte_lavoro_flutter_app/pages/annunci_dip_page.dart' as _i3;
import 'package:offerte_lavoro_flutter_app/pages/annunci_freelance_page.dart'
    as _i2;
import 'package:offerte_lavoro_flutter_app/pages/annunci_preferiti_page.dart'
    as _i4;
import 'package:offerte_lavoro_flutter_app/pages/content_page.dart' as _i1;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ContentRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ContentPage(),
      );
    },
    AnnunciFreelanceRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AnnunciFreelancePage(),
      );
    },
    AnnunciDipRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AnnunciDipPage(),
      );
    },
    AnnunciPreferitiRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AnnunciPreferitiPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContentPage]
class ContentRoute extends _i5.PageRouteInfo<void> {
  const ContentRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContentRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AnnunciFreelancePage]
class AnnunciFreelanceRoute extends _i5.PageRouteInfo<void> {
  const AnnunciFreelanceRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AnnunciFreelanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnunciFreelanceRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AnnunciDipPage]
class AnnunciDipRoute extends _i5.PageRouteInfo<void> {
  const AnnunciDipRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AnnunciDipRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnunciDipRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AnnunciPreferitiPage]
class AnnunciPreferitiRoute extends _i5.PageRouteInfo<void> {
  const AnnunciPreferitiRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AnnunciPreferitiRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnunciPreferitiRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
