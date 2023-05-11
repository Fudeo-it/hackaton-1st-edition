import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragePreferencesService {
  static const _kShowSplashPage = "MainPage.SplashPage.SHOW_SPLASH_PAGE";

  final Future<SharedPreferences> sharedPrefFuture;
  SharedPreferences? _instance;

  LocalStoragePreferencesService({required this.sharedPrefFuture});

  FutureOr<void> hideSplashPageToStartup() async =>
      (await preferences).setBool(_kShowSplashPage, false);

  FutureOr<void> showSplashPageToStartup() async =>
      (await preferences).setBool(_kShowSplashPage, true);

  Future<bool?> get showSplashPage async =>
      (await preferences).getBool(_kShowSplashPage);

  FutureOr<SharedPreferences> get preferences async =>
      _instance ??= await sharedPrefFuture;
}
