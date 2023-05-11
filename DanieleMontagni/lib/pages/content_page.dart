import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/router/app_router.gr.dart';

@RoutePage()
class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
        animationCurve: Curves.easeInQuad,
        routes: [
          AnnunciDipRoute(),
          AnnunciFreelanceRoute(),
          AnnunciPreferitiRoute(),
        ],
        transitionBuilder: (context, child, animation) => child,
        bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.work_history_rounded,
                ),
                label: 'Dipendenti'),
            BottomNavigationBarItem(
                icon: Icon(Icons.work_history_rounded), label: 'Freelance'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_rounded), label: 'Preferiti'),
          ],
        ),
      );
}
