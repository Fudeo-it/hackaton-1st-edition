import 'package:flutter/material.dart';
import 'package:jobs_search/providers/main_provider.dart';
import 'package:jobs_search/screens/favourites_list.dart';
import 'package:jobs_search/screens/jobs_list.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'Annunci',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Preferiti',
        ),
      ],
      currentIndex: context.watch<MainProvider>().currentTabIndex,
      onTap: (index) {
        var currentIndex = context.read<MainProvider>().currentTabIndex;
        if (currentIndex == index) {
          return;
        }

        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) {
              if (index == 1) {
                return const FavouritesList();
              }
              return const JobsList();
            },
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );

        context.read<MainProvider>().setCurrentTabIndex(index);
      },
    );
  }
}
