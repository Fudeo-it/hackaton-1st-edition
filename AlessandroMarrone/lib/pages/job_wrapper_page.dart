import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/pages/screens/drawer_screen.dart';

import 'package:offertelavoroflutter_it_app/pages/screens/job_offers_screen.dart';
import 'package:offertelavoroflutter_it_app/pages/screens/saved_job_offers_screen.dart';
import 'package:offertelavoroflutter_it_app/pages/screens/training_flutter_screen.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/app_localizations_no_context.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/get_system_ui_overlay.dart';

class JobWrapperPage extends StatefulWidget {
  final List<JobOfferModel>? jobHiring;
  final List<JobProjectModel>? jobFreelance;
  const JobWrapperPage({Key? key, this.jobFreelance, this.jobHiring})
      : super(key: key);

  @override
  State<JobWrapperPage> createState() => _JobWrapperPageState();
}

class _JobWrapperPageState extends State<JobWrapperPage> {
  int _currentNavBarIndex = 0;

  final _bottomNavigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.briefcase),
      label: AppLocalizationsNoContext.current.bottom_nav_label_home,
    ),
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.bookmarkMinus),
      label: AppLocalizationsNoContext.current.bottom_nav_label_saved,
    ),
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.graduationCap),
      label: AppLocalizationsNoContext.current.bottom_nav_label_training,
    ),
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.sliders),
      label: AppLocalizationsNoContext.current.bottom_nav_label_settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        GetSystemUIOverlay.getSystemUIOverlayStyle(context));
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) =>
                FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            child: _NavigationDestinationScreen(
              key: UniqueKey(),
              currentIndex: _currentNavBarIndex,
              jobsHiring: widget.jobHiring,
              jobsFreelance: widget.jobFreelance,
            ),
          ),
          drawer: const DrawerScreen(),
          bottomNavigationBar: LayoutBuilder(
            builder: (context, _) => BottomNavigationBar(
              selectedFontSize: 12.0,
              items: _bottomNavigationBarItems,
              currentIndex: _currentNavBarIndex,
              onTap: (index) {
                if (index == 3) {
                  Scaffold.of(context).openDrawer();
                } else {
                  setState(() {
                    _currentNavBarIndex = index;
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationDestinationScreen extends StatelessWidget {
  final List<JobOfferModel>? jobsHiring;
  final List<JobProjectModel>? jobsFreelance;
  final int currentIndex;
  const _NavigationDestinationScreen(
      {Key? key,
      required this.currentIndex,
      this.jobsHiring,
      this.jobsFreelance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return JobOffersScreen(
          jobFreelance: jobsFreelance,
          jobHiring: jobsHiring,
        );

      case 1:
        return SavedJobOffersScreen(
          jobsFreelance: jobsFreelance,
          jobsHiring: jobsHiring,
        );

      case 2:
        return const TrainingFlutterScreen();

      default:
    }

    return const SizedBox();
  }
}
