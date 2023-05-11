import 'package:auto_route/auto_route.dart';
import 'package:offerte_lavoro_flutter_app/router/app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: ContentRoute.page, path: '/', children: [
      AutoRoute(page: AnnunciDipRoute.page),
      AutoRoute(page: AnnunciFreelanceRoute.page),
      AutoRoute(page: AnnunciPreferitiRoute.page)
    ]),
  ];
}
