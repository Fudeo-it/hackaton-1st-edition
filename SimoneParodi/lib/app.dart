import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/cubits/dark_mode_cubit.dart';
import 'package:offertelavoroflutter/di/dependency_injector.dart';
import 'package:offertelavoroflutter/pages/details_announcement_page.dart';
import 'package:offertelavoroflutter/pages/details_freelance_project_page.dart';
import 'package:offertelavoroflutter/pages/freelance_projects_page.dart';
import 'package:offertelavoroflutter/pages/announcements_page.dart';
import 'package:offertelavoroflutter/pages/main_page.dart';
import 'package:offertelavoroflutter/themes/my_theme.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DependecyInjector(
      child: BlocBuilder<DarkModeCubit, bool>(
        builder: (context, darkModeEnabled) {
          return MaterialApp(
            title: 'Offerte Flutter',
            debugShowCheckedModeBanner: false,
            themeMode: darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
            theme: MyTheme.light(),
            darkTheme: MyTheme.dark(),
            initialRoute: MainPage.route,
            onGenerateRoute: (settings) {
              final route = {
                MainPage.route: const MainPage(),
                AnnouncementPage.route: const AnnouncementPage(),
                DetailsAnnouncementPage.route: const DetailsAnnouncementPage(),
                FreelanceProjectPage.route: const FreelanceProjectPage(),
                DetailsFreelanceProjectPage.route:
                    const DetailsFreelanceProjectPage(),
              }[settings.name];
              return MaterialPageRoute(
                builder: (context) => route!,
                settings: settings,
              );
            },
          );
        },
      ),
    );
  }
}
