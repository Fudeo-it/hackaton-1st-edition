import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/ui/pages/favorites_page.dart';
import 'package:offertelavoroflutter/ui/pages/home_page.dart';
import 'package:offertelavoroflutter/ui/pages/public_job_offer_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  static const route = '/';

  @override
  State<NavigationPage> createState() => _NavigationPage();
}

class _NavigationPage extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FavoritesPage(),
    PublicJobOfferPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: l10n.ads,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark),
            label: l10n.favorites,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.edit),
            label: l10n.publish,
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

}