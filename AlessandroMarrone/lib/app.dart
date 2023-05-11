import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_it_app/di/dependency_injector.dart';
import 'package:offertelavoroflutter_it_app/router/app_router.gr.dart';
import 'package:offertelavoroflutter_it_app/themes/models/dark_theme.dart';
import 'package:offertelavoroflutter_it_app/themes/models/light_theme.dart';
import 'package:offertelavoroflutter_it_app/themes/widgets/theme_selector.dart';

class OfferteLavoroFlutterApp extends StatelessWidget {
  final _router = AppRouter();
  OfferteLavoroFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dependencyinjector(
      child: ThemeSelector(
        builder: (context, mode) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) =>
              AppLocalizations.of(context)?.app_name ?? "app_name",
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routeInformationParser: _router.defaultRouteParser(),
          routerDelegate: _router.delegate(),
          theme: LightTheme.make,
          darkTheme: DarkTheme.make,
          themeMode: mode,
        ),
      ),
    );
  }
}
