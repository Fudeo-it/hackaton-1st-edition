import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offerte_lavoro_flutter_app/blocs/bloc/annuncio_bloc.dart';
import 'package:offerte_lavoro_flutter_app/blocs/freelanceBloc/bloc/annuncio_freelance_bloc.dart';
import 'package:offerte_lavoro_flutter_app/cubits/dark_mode_cubit.dart';
import 'package:offerte_lavoro_flutter_app/repositories/annuncio_freelance_repository.dart';
import 'package:offerte_lavoro_flutter_app/repositories/annuncio_repositories.dart';
import 'package:offerte_lavoro_flutter_app/router/app_router.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(_) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (_) => AnnuncioRepository(),
          ),
          RepositoryProvider(
            create: (_) => AnnuncioFreelanceRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => DarkModeCubit(),
            ),
            BlocProvider(
              create: (context) =>
                  AnnuncioBloc(annuncioRepository: AnnuncioRepository()),
            ),
            BlocProvider(
              create: (context) => AnnuncioFreelanceBloc(
                  annuncioFreelanceRepository: AnnuncioFreelanceRepository())..add(FetchAnnuncioFreelanceEvent()),
            ),
          ],
          child: _themeSelector(
            (context, mode) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Offerte lavoro flutter app',
              theme: _theme(context),
              darkTheme: _darkTheme(context),
              themeMode: mode,
              routerDelegate: AutoRouterDelegate(_appRouter),
              routeInformationParser: _appRouter.defaultRouteParser(),
            ),
          ),
        ));
  }

  Widget _themeSelector(
          Widget Function(BuildContext context, ThemeMode mode) builder) =>
      BlocBuilder<DarkModeCubit, bool>(
        builder: (context, darkModeEnabled) => builder(
          context,
          darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        ),
      );

  ThemeData _theme(BuildContext context) {
    const primaryColorDark = Color.fromARGB(255, 6, 29, 92);
    const primaryColorLight = Color.fromARGB(255, 2, 125, 253);
    const accentColor = Color.fromARGB(255, 255, 222, 89);
    final onSecondaryColor = Colors.grey[100]!;

    return ThemeData(
      primaryColor: primaryColorLight,
      primaryColorDark: primaryColorDark,
      colorScheme: ColorScheme.light(
        primary: primaryColorLight,
        secondary: accentColor,
        surface: onSecondaryColor,
        onSecondary: onSecondaryColor,
      ),
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }

  ThemeData _darkTheme(BuildContext context) {
    const primaryColorDark = Color.fromARGB(255, 6, 29, 92);
    const primaryColorLight = Color.fromARGB(255, 2, 125, 253);
    const accentColor = Color.fromARGB(255, 255, 222, 89);
    return ThemeData(
      primaryColor: primaryColorLight,
      primaryColorDark: primaryColorDark,
      colorScheme: ColorScheme.dark(
        primary: primaryColorLight,
        secondary: accentColor,
      ),
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
