import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/pages/details_page/freelance_details_page.dart';
import 'package:offertelavoroflutter_app/pages/details_page/job_details_page.dart';
import 'package:offertelavoroflutter_app/pages/home/home_page.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/jobs_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: JobsRoute.page),
        AutoRoute(page: JobDetailsRoute.page),
        AutoRoute(page: FreelanceDetailsRoute.page),
      ];
}
