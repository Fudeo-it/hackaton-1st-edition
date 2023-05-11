import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:offertelavoroflutter/models/models.dart';
import 'package:offertelavoroflutter/pages/pages.dart';
import 'package:offertelavoroflutter/styles.dart';
import 'package:offertelavoroflutter/widgets/custom_buttons.dart';

class Routers {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: SplashPage());
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/recruitment',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: RecruitmentPage(
              recruitment: state.extra as Recruitment,
            ),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/freelance',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: FreelancePage(
              freelance: state.extra as Freelance,
            ),
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Styles.kRadius,
                topRight: Styles.kRadius,
              ),
              child: BottomAppBar(
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconButton(
                      icon: Ionicons.briefcase,
                      color: state.subloc == '/home'
                          ? Styles.kPrimaryColor
                          : Styles.kSecondaryColor,
                      size: 32,
                      onTap: () {
                        context.go('/home');
                      },
                    ),
                    const SizedBox(width: 30),
                    CustomIconButton(
                      icon: Ionicons.search,
                      color: state.subloc == '/filters'
                          ? Styles.kPrimaryColor
                          : Styles.kSecondaryColor,
                      size: 32,
                      onTap: () {
                        context.go('/filters');
                      },
                    ),
                    const SizedBox(width: 30),
                    CustomIconButton(
                      icon: Ionicons.bookmark,
                      color: state.subloc == '/bookmark'
                          ? Styles.kPrimaryColor
                          : Styles.kSecondaryColor,
                      size: 32,
                      onTap: () {
                        context.go('/bookmark');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: HomePage());
            },
          ),
          GoRoute(
            path: '/filters',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: FiltersPage());
            },
          ),
          GoRoute(
            path: '/bookmark',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: BookmarkPage());
            },
          ),
        ],
      ),
    ],
  );
}
