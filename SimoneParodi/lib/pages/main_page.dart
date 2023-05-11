import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter/blocs/announcement/announcement_bloc.dart';
import 'package:offertelavoroflutter/blocs/freelance_project/freelance_project_bloc.dart';
import 'package:offertelavoroflutter/cubits/dark_mode_cubit.dart';
import 'package:offertelavoroflutter/cubits/device_cubit.dart';
import 'package:offertelavoroflutter/cubits/favorite_mode_cubit.dart';
import 'package:offertelavoroflutter/cubits/main_page_controller/main_page_controller_cubit.dart';
import 'package:offertelavoroflutter/misc/painter/bubble_indicator_painter.dart';
import 'package:offertelavoroflutter/pages/details_announcement_page.dart';
import 'package:offertelavoroflutter/pages/details_freelance_project_page.dart';
import 'package:offertelavoroflutter/pages/freelance_projects_page.dart';
import 'package:offertelavoroflutter/pages/announcements_page.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';

class MainPage extends StatelessWidget {
  static const route = '/';
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageViewControllerCubit(),
      child: LayoutBuilder(
        builder: (context, boxConstraints) {
          context.read<DeviceCubit>().select(width: boxConstraints.maxWidth);
          return Row(
            children: [
              Flexible(
                flex: 4,
                child: _offerList(context),
              ),
              if (boxConstraints.maxWidth > DeviceSize.tablet) _details(context)
            ],
          );
        },
      ),
    );
  }

  Widget _offerList(BuildContext context) => Scaffold(
        appBar: _appBar(context),
        body: Stack(
          alignment: Alignment.center,
          children: [
            _pageView(context),
            _selector(context),
          ],
        ),
      );

  Widget _details(BuildContext context) => Flexible(
        flex: 5,
        child: BlocBuilder<MainPageViewControllerCubit,
            MainPageViewControllerState>(
          builder: (context, state) {
            if (state.page < 0.5) {
              return const DetailsAnnouncementPage();
            }
            return const DetailsFreelanceProjectPage();
          },
        ),
      );

  Widget _selector(BuildContext context) => Positioned(
        bottom: 15,
        child: SafeArea(
          right: false,
          left: false,
          child: Container(
            width: 230,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
            ),
            padding: const EdgeInsets.symmetric(horizontal: MyInsets.s),
            child: BlocBuilder<DarkModeCubit, bool>(
              builder: (context, darkModeEnabled) {
                final bubbleTextColor =
                    Theme.of(context).colorScheme.onBackground;
                final textColor = darkModeEnabled ? Colors.black : Colors.white;
                return CustomPaint(
                  painter: BubbleIndicatorPainter(
                    pageController: context
                        .read<MainPageViewControllerCubit>()
                        .pageController,
                    backgroundColor: Theme.of(context).colorScheme.background,
                  ),
                  child: BlocBuilder<MainPageViewControllerCubit,
                      MainPageViewControllerState>(
                    builder: (context, state) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => context
                              .read<MainPageViewControllerCubit>()
                              .selectPage(
                                pageIndex: 0,
                              ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: MyInsets.s),
                            child: Text(
                              'Annunci di \nlavoro',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: state.page >= 0 && state.page < 0.7
                                    ? bubbleTextColor
                                    : textColor,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () => context
                              .read<MainPageViewControllerCubit>()
                              .selectPage(
                                pageIndex: 1,
                              ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: MyInsets.xs),
                            child: Text(
                              'Progetti per \nfreelance ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: state.page <= 1 && state.page > 0.3
                                    ? bubbleTextColor
                                    : textColor,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );

  Widget _toogleDarkMode(BuildContext context) =>
      BlocBuilder<DarkModeCubit, bool>(
        builder: (context, state) {
          return IconButton(
            icon: Icon(
              state ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () => context.read<DarkModeCubit>().toggleDarkMode(),
          );
        },
      );

  PreferredSizeWidget _appBar(BuildContext context) => AppBar(
        title: _appBarTitle(context),
        leading: _toogleDarkMode(context),
        actions: [
          _toogleFavoriteMode(context),
        ],
      );

  Widget _pageView(BuildContext context) => PageView(
        controller: context.read<MainPageViewControllerCubit>().pageController,
        children: const [
          AnnouncementPage(),
          FreelanceProjectPage(),
        ],
      );

  Widget _toogleFavoriteMode(BuildContext context) => IconButton(
        onPressed: () {
          if (context.read<AnnouncementBloc>().state
                  is! FetchingAnnouncementState &&
              context.read<FreelanceProjectBloc>().state
                  is! FetchingFreelanceProjectState) {
            context.read<FavoriteModeCubit>().toogle();
            context.read<AnnouncementBloc>().onFetch();
            context.read<FreelanceProjectBloc>().onFetch();
          }
        },
        icon: BlocBuilder<FavoriteModeCubit, bool>(
          builder: (context, favoriteMode) => Icon(
            favoriteMode
                ? FontAwesomeIcons.solidBookmark
                : FontAwesomeIcons.bookmark,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      );

  Widget _appBarTitle(BuildContext context) =>
      BlocBuilder<FavoriteModeCubit, bool>(
        builder: (context, favoriteMode) => favoriteMode
            ? const Text('Preferiti')
            : const Text('Offerte lavoro'),
      );
}
