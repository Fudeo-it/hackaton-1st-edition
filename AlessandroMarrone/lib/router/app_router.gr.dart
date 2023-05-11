// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart'
    as _i8;
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart'
    as _i7;
import 'package:offertelavoroflutter_it_app/pages/job_apply_page.dart' as _i4;
import 'package:offertelavoroflutter_it_app/pages/job_wrapper_page.dart' as _i3;
import 'package:offertelavoroflutter_it_app/pages/main_page.dart' as _i1;
import 'package:offertelavoroflutter_it_app/pages/splash_page.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    SplashPageRoute.name: (routeData) {
      final args = routeData.argsAs<SplashPageRouteArgs>(
          orElse: () => const SplashPageRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.SplashPage(
          key: args.key,
          jobFreelance: args.jobFreelance,
          jobHiring: args.jobHiring,
        ),
      );
    },
    JobWrapperPageRoute.name: (routeData) {
      final args = routeData.argsAs<JobWrapperPageRouteArgs>(
          orElse: () => const JobWrapperPageRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.JobWrapperPage(
          key: args.key,
          jobFreelance: args.jobFreelance,
          jobHiring: args.jobHiring,
        ),
      );
    },
    JobApplyPageRoute.name: (routeData) {
      final args = routeData.argsAs<JobApplyPageRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.JobApplyPage(
          key: args.key,
          url: args.url,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          MainPageRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          SplashPageRoute.name,
          path: 'welcome',
        ),
        _i5.RouteConfig(
          JobWrapperPageRoute.name,
          path: 'jobs',
        ),
        _i5.RouteConfig(
          JobApplyPageRoute.name,
          path: 'apply',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainPageRoute extends _i5.PageRouteInfo<void> {
  const MainPageRoute()
      : super(
          MainPageRoute.name,
          path: '/',
        );

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [_i2.SplashPage]
class SplashPageRoute extends _i5.PageRouteInfo<SplashPageRouteArgs> {
  SplashPageRoute({
    _i6.Key? key,
    List<_i7.JobProjectModel>? jobFreelance,
    List<_i8.JobOfferModel>? jobHiring,
  }) : super(
          SplashPageRoute.name,
          path: 'welcome',
          args: SplashPageRouteArgs(
            key: key,
            jobFreelance: jobFreelance,
            jobHiring: jobHiring,
          ),
        );

  static const String name = 'SplashPageRoute';
}

class SplashPageRouteArgs {
  const SplashPageRouteArgs({
    this.key,
    this.jobFreelance,
    this.jobHiring,
  });

  final _i6.Key? key;

  final List<_i7.JobProjectModel>? jobFreelance;

  final List<_i8.JobOfferModel>? jobHiring;

  @override
  String toString() {
    return 'SplashPageRouteArgs{key: $key, jobFreelance: $jobFreelance, jobHiring: $jobHiring}';
  }
}

/// generated route for
/// [_i3.JobWrapperPage]
class JobWrapperPageRoute extends _i5.PageRouteInfo<JobWrapperPageRouteArgs> {
  JobWrapperPageRoute({
    _i6.Key? key,
    List<_i7.JobProjectModel>? jobFreelance,
    List<_i8.JobOfferModel>? jobHiring,
  }) : super(
          JobWrapperPageRoute.name,
          path: 'jobs',
          args: JobWrapperPageRouteArgs(
            key: key,
            jobFreelance: jobFreelance,
            jobHiring: jobHiring,
          ),
        );

  static const String name = 'JobWrapperPageRoute';
}

class JobWrapperPageRouteArgs {
  const JobWrapperPageRouteArgs({
    this.key,
    this.jobFreelance,
    this.jobHiring,
  });

  final _i6.Key? key;

  final List<_i7.JobProjectModel>? jobFreelance;

  final List<_i8.JobOfferModel>? jobHiring;

  @override
  String toString() {
    return 'JobWrapperPageRouteArgs{key: $key, jobFreelance: $jobFreelance, jobHiring: $jobHiring}';
  }
}

/// generated route for
/// [_i4.JobApplyPage]
class JobApplyPageRoute extends _i5.PageRouteInfo<JobApplyPageRouteArgs> {
  JobApplyPageRoute({
    _i6.Key? key,
    required String url,
  }) : super(
          JobApplyPageRoute.name,
          path: 'apply',
          args: JobApplyPageRouteArgs(
            key: key,
            url: url,
          ),
        );

  static const String name = 'JobApplyPageRoute';
}

class JobApplyPageRouteArgs {
  const JobApplyPageRouteArgs({
    this.key,
    required this.url,
  });

  final _i6.Key? key;

  final String url;

  @override
  String toString() {
    return 'JobApplyPageRouteArgs{key: $key, url: $url}';
  }
}
