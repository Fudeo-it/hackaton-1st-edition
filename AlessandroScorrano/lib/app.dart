import 'package:annunci_lavoro_flutter/cubits/dark_mode_cubit.dart';
import 'package:annunci_lavoro_flutter/cubits/first_start_cubit.dart';
import 'package:annunci_lavoro_flutter/di/dependency_injector.dart';
import 'package:annunci_lavoro_flutter/pages/favourite_page.dart';
import 'package:annunci_lavoro_flutter/pages/home_page.dart';
import 'package:annunci_lavoro_flutter/pages/welcome_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(_) {
    return DependencyInjector(
      child: _themeSelector(
        (context, mode) => BlocBuilder<FirstStartCubit, bool>(
          builder: (context, startState) {
            return MaterialApp(
              locale: const Locale('it_IT'),
              debugShowCheckedModeBanner: false,
              home: startState ? WelcomeCarousel() : HomePage(),
              themeMode: mode,
              theme: _theme(context),
              darkTheme: _darkTheme(context),
              onGenerateRoute: (settings) {
                if (settings.name == FavouritePage.routeName) {
                  return PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const FavouritePage(),
                  );
                } else if (settings.name == HomePage.routeName) {
                  return PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const HomePage(),
                  );
                } else {
                  return null;
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget _themeSelector(
          Widget Function(BuildContext context, ThemeMode mode) builder) =>
      BlocBuilder<DarkModeCubit, bool>(
        builder: (context, darkModeEnabled) => builder(
          context,
          darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        ),
      );
}

ThemeData _theme(BuildContext context) {
  final primaryColor = Color(0x027DFD).withOpacity(1);
  final primaryColorDark = Color(0x061D5C).withOpacity(1);
  final prymaryColorLight = Color(0xFFDE59).withOpacity(1);
  const secondaryColor = Colors.white;
  final onSecondaryColor = Colors.grey[100]!;

  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade200,
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: prymaryColorLight,
    secondaryHeaderColor: Colors.grey[300],
    highlightColor: prymaryColorLight,
    indicatorColor: Colors.black87,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: secondaryColor,
      onSecondary: onSecondaryColor,
    ),
    brightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: primaryColorDark),
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
  );
}

ThemeData _darkTheme(BuildContext context) {
  final primaryColorDark = const Color(0x027DFD).withOpacity(1);
  final primaryColor = Color(0x027DFD).withOpacity(1);
  final prymaryColorlight = const Color(0xFFDE59).withOpacity(1);
  const secondaryColor = Colors.white;
  return ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 45, 45, 45),
    secondaryHeaderColor: Colors.grey.shade800,
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: prymaryColorlight,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: secondaryColor,
    ),
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    iconTheme: IconThemeData(color: Colors.grey.shade500),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromARGB(255, 37, 37, 37)),
    textTheme: GoogleFonts.montserratTextTheme(
      const TextTheme(),
    ),
  );
}
