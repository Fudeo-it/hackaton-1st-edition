import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/favorites/screens/favorites_screen/favorites_screen.dart';
import 'package:offertelavoroflutter_app/modules/home/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:offertelavoroflutter_app/modules/job_offer/screens/job_offers_screen/job_offers_screen.dart';
import 'package:offertelavoroflutter_app/modules/publish_job_offer/screens/publish_job_offer_screen.dart';
import 'package:offertelavoroflutter_app/modules/resources/screens/resources_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key}) : super(key: key);

  getBottomNavItemColorFilter(bool active, BuildContext context) {
    return ColorFilter.mode(active ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor! : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!, BlendMode.srcIn);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: LazyLoadIndexedStack(
            index: state.activeTabIndex,
            children: const [
              JobOffersScreen(),
              FavoritesScreen(),
              PublishJobOfferScreen(),
              ResourcesScreen()
            ],
          ),
          bottomNavigationBar: _buildBottomNavBar(state.activeTabIndex, context),
        );
      },
    );
  }

  Widget _buildBottomNavBar(int activeTabIndex, BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => context.read<HomeScreenBloc>().add(HomeScreenEvent.activeTabChanged(index)),
      currentIndex: activeTabIndex,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: Theme.of(context).textTheme.bodySmall,
      unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: Styles.lightText),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/view-schedule.svg', colorFilter: getBottomNavItemColorFilter(activeTabIndex == 0, context)),
          label: AppLocalizations.of(context)!.bottomNavItemJobOffers
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/bookmark.svg', colorFilter: getBottomNavItemColorFilter(activeTabIndex == 1, context)),
          label: AppLocalizations.of(context)!.bottomNavItemFavorites
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/edit.svg', colorFilter: getBottomNavItemColorFilter(activeTabIndex == 2, context)),
          label: AppLocalizations.of(context)!.bottomNavItemPublishJobOffer
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/book.svg', colorFilter: getBottomNavItemColorFilter(activeTabIndex == 3, context)),
          label: AppLocalizations.of(context)!.bottomNavItemResources
        ),
      ]
    );
  }
}
