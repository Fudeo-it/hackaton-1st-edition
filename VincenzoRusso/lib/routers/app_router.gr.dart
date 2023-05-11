// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    JobsRoute.name: (routeData) {
      final args = routeData.argsAs<JobsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: JobsPage(
          key: args.key,
          initialPage: args.initialPage,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    JobDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<JobDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: JobDetailsPage(
          jobID: args.jobID,
          key: args.key,
        )),
      );
    },
    FreelanceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FreelanceDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: FreelanceDetailsPage(
          jobID: args.jobID,
          key: args.key,
        )),
      );
    },
  };
}

/// generated route for
/// [JobsPage]
class JobsRoute extends PageRouteInfo<JobsRouteArgs> {
  JobsRoute({
    Key? key,
    required int initialPage,
    List<PageRouteInfo>? children,
  }) : super(
          JobsRoute.name,
          args: JobsRouteArgs(
            key: key,
            initialPage: initialPage,
          ),
          initialChildren: children,
        );

  static const String name = 'JobsRoute';

  static const PageInfo<JobsRouteArgs> page = PageInfo<JobsRouteArgs>(name);
}

class JobsRouteArgs {
  const JobsRouteArgs({
    this.key,
    required this.initialPage,
  });

  final Key? key;

  final int initialPage;

  @override
  String toString() {
    return 'JobsRouteArgs{key: $key, initialPage: $initialPage}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobDetailsPage]
class JobDetailsRoute extends PageRouteInfo<JobDetailsRouteArgs> {
  JobDetailsRoute({
    required String jobID,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          JobDetailsRoute.name,
          args: JobDetailsRouteArgs(
            jobID: jobID,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'JobDetailsRoute';

  static const PageInfo<JobDetailsRouteArgs> page =
      PageInfo<JobDetailsRouteArgs>(name);
}

class JobDetailsRouteArgs {
  const JobDetailsRouteArgs({
    required this.jobID,
    this.key,
  });

  final String jobID;

  final Key? key;

  @override
  String toString() {
    return 'JobDetailsRouteArgs{jobID: $jobID, key: $key}';
  }
}

/// generated route for
/// [FreelanceDetailsPage]
class FreelanceDetailsRoute extends PageRouteInfo<FreelanceDetailsRouteArgs> {
  FreelanceDetailsRoute({
    required String jobID,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FreelanceDetailsRoute.name,
          args: FreelanceDetailsRouteArgs(
            jobID: jobID,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FreelanceDetailsRoute';

  static const PageInfo<FreelanceDetailsRouteArgs> page =
      PageInfo<FreelanceDetailsRouteArgs>(name);
}

class FreelanceDetailsRouteArgs {
  const FreelanceDetailsRouteArgs({
    required this.jobID,
    this.key,
  });

  final String jobID;

  final Key? key;

  @override
  String toString() {
    return 'FreelanceDetailsRouteArgs{jobID: $jobID, key: $key}';
  }
}
