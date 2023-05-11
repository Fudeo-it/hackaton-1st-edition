import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl_standalone.dart';
import 'package:offertelavoroflutter_app/constants/routes.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/app_preferences/repositories/app_preferences_repository.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/blocs/splash_screen_bloc.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/widgets/theme_mode_switcher/bloc/theme_mode_switcher_bloc.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/widgets/theme_mode_switcher/theme_mode_switcher.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/repositories/freelance_job_offer_repository.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/screens/freelance_job_offer_detail_screen/freelance_job_offer_detail_screen.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/repositories/hiring_job_offer_repository.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/screens/hiring_job_offer_detail_screen/hiring_job_offer_detail_screen.dart';
import 'package:offertelavoroflutter_app/modules/home/screens/home_screen/home_screen.dart';
import 'package:offertelavoroflutter_app/modules/onboarding/screens/onboarding_screen/onboarding_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // we remove the splash screen manually with the SplashScreenBloc
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await findSystemLocale();
  GoogleFonts.config.allowRuntimeFetching = false;
  await loadEnv();
  await initHive();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

loadEnv() async {
  try {
    await dotenv.load(fileName: 'environment/.env');
  } catch (err) {
    throw Exception(
        'File environment/.env missing or empty, please follow the instructions in the README file to create it correctly');
  }
}

initHive() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(HiringJobOfferRepository.favoriteHiringJobOffersBox);
  await Hive.openBox<String>(FreelanceJobOfferRepository.favoriteFreelanceJobOffersBox);
  await Hive.openBox(AppPreferencesRepository.appPreferencesBox);
}

class MyApp extends StatelessWidget {
  final GlobalKey appKey =
      GlobalKey(); // The key is important for the theme switching animation, without it the app gets recreated because it changes the position in the widget tree

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HiringJobOfferRepository>(create: (context) => HiringJobOfferRepository()),
        RepositoryProvider<FreelanceJobOfferRepository>(create: (context) => FreelanceJobOfferRepository()),
        RepositoryProvider<AppPreferencesRepository>(create: (context) => AppPreferencesRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashScreenBloc()),
          BlocProvider(
              create: (context) => ThemeModeSwitcherBloc(
                  appPreferencesRepository: RepositoryProvider.of<AppPreferencesRepository>(context))),
        ],
        child: ThemeModeSwitcher(
          builder: (themeMode) => MaterialApp(
            key: appKey,
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: _getThemeData(false, context),
            darkTheme: _getThemeData(true, context),
            themeMode: themeMode,
            initialRoute: Routes.onboarding,
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case Routes.onboarding:
                  return MaterialPageRoute<void>(builder: (context) => const OnboardingScreen(), settings: settings);

                case Routes.home:
                  return MaterialPageRoute<void>(builder: (context) => const HomeScreen(), settings: settings);

                case Routes.hiringJobOfferDetail:
                  return MaterialPageRoute<void>(
                      builder: (context) => HiringJobOfferDetailScreen(
                          args: ModalRoute.of(context)?.settings.arguments as HiringJobOfferDetailScreenArgs),
                      settings: settings);

                case Routes.freelanceJobOfferDetail:
                  return MaterialPageRoute<void>(
                      builder: (context) => FreelanceJobOfferDetailScreen(
                          args: ModalRoute.of(context)?.settings.arguments as FreelanceJobOfferDetailScreenArgs),
                      settings: settings);

                default:
                  throw Exception('Invalid route: ${settings.name}');
              }
            },
          ),
        ),
      ),
    );
  }

  ThemeData _getThemeData(bool dark, BuildContext context) {
    return ThemeData(
        colorScheme: dark
            ? ColorScheme.dark(
                primary: Styles.primaryLight,
                secondary: Styles.accent,
                tertiary: Styles.darkSurface,
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onTertiary: Colors.white,
                background: Styles.darkBackground,
                surface: Styles.darkSurface,
                shadow: Styles.darkShadow,
              )
            : ColorScheme.light(
                primary: Styles.primaryDark,
                secondary: Styles.accent,
                tertiary: Styles.lightBackground,
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onTertiary: Styles.primaryDark,
                background: Styles.lightBackground,
                surface: Colors.white,
                shadow: Styles.lightShadow),
        scaffoldBackgroundColor: dark ? Styles.darkBackground : Colors.white,
        textTheme: _getTextTheme(dark, context),
        cardTheme: _getCardTheme(context),
        inputDecorationTheme: _getInputDecoratorTheme(dark, context),
        elevatedButtonTheme: _getElevatedBtnThemeData(context),
        snackBarTheme: _getSnackBarThemeData(dark, context),
        appBarTheme: _getAppBarTheme(dark, context),
        bottomNavigationBarTheme: _getBottomNavigationBarThemeData(dark, context),
        bottomSheetTheme: _getBottomSheetTheme(dark, context));
  }

  TextTheme _getTextTheme(bool dark, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Color textColor = dark ? Colors.white : Styles.primaryDark;
    return GoogleFonts.montserratTextTheme(textTheme.copyWith(
      headlineLarge: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, color: textColor),
      headlineMedium: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: textColor),
      headlineSmall: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: textColor),
      titleLarge: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: textColor),
      titleMedium: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: textColor),
      titleSmall: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: textColor),
      bodyLarge: textTheme.bodyLarge?.copyWith(color: textColor),
      bodyMedium: textTheme.bodyMedium?.copyWith(color: textColor),
      bodySmall: textTheme.bodySmall?.copyWith(color: textColor),
    ));
  }

  CardTheme _getCardTheme(BuildContext context) {
    return CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  ElevatedButtonThemeData _getElevatedBtnThemeData(BuildContext context) {
    return ElevatedButtonThemeData(
        style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(48, 48)),
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    ));
  }

  InputDecorationTheme _getInputDecoratorTheme(bool dark, BuildContext context) {
    return InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: dark ? Styles.darkSurface : Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ));
  }

  SnackBarThemeData _getSnackBarThemeData(bool dark, BuildContext context) {
    return SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: dark ? Styles.primaryLight : Styles.primaryDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  AppBarTheme _getAppBarTheme(bool dark, BuildContext context) {
    return AppBarTheme(
        backgroundColor: dark ? Styles.darkBackground : Colors.white,
        iconTheme: IconThemeData(color: dark ? Colors.white : Styles.primaryDark));
  }

  BottomNavigationBarThemeData _getBottomNavigationBarThemeData(bool dark, BuildContext context) {
    return BottomNavigationBarThemeData(
      backgroundColor: dark ? Styles.darkSurface : Colors.white,
      selectedLabelStyle: Theme.of(context).textTheme.bodySmall,
      selectedItemColor: dark ? Styles.primaryLight : Styles.primaryDark,
      unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
      unselectedItemColor: dark ? Colors.white : Styles.lightText,
    );
  }

  BottomSheetThemeData _getBottomSheetTheme(bool dark, BuildContext context) {
    return BottomSheetThemeData(backgroundColor: dark ? Styles.darkBackground : Colors.white);
  }
}
