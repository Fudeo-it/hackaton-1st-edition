import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/app/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  late final router = buildRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      themeMode: ThemeMode.system,
      theme: FlexThemeData.light(
        scheme: FlexScheme.blueM3,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.blueM3,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: "Hackathon Fudeo",
    );
  }
}
