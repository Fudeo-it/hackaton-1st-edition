import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/app/presentation/cubit/navbar/navigation_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resources/string_constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
  });

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    int selectedIndex = context.watch<NavigationCubit>().state.selectedIndex;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.zero,
        color: Theme.of(context).colorScheme.background,
        height: orientation == Orientation.landscape
            ? 80
            : 80, //funziona con 80 in verticale
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              selectedFontSize: 14,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedFontSize: 14,
              elevation: 0,
              currentIndex: selectedIndex,
              iconSize: 22,
              onTap: (index) {
                context.read<NavigationCubit>().setPageIndex(index);
              },
              selectedItemColor: Theme.of(context).colorScheme.primary,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.corporate_fare,
                  ),
                  label: StringConsts.bottomNavAziende,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmarks,
                  ),
                  label: StringConsts.bottomNavBookmarked,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                  ),
                  label: StringConsts.bottomNavFreelancers,
                ),
              ],
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("supporto:", style: TextStyle(fontSize: 12)),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onBackground,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () async {
                    String email = "contattaci@offertelavoroflutter.it";
                    String subject = "Informazioni";
                    Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: email,
                      query: encodeQueryParameters(
                        <String, String>{'subject': subject},
                      ),
                    );
                    if (await canLaunchUrl(emailUri)) {
                      await launchUrl(emailUri);
                    } else {
                      throw "Errore nell'invio della email";
                    }
                  },
                  child: const Text(StringConsts.footer1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline)),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
