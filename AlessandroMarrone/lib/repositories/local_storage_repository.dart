import 'dart:async';

import 'package:offertelavoroflutter_it_app/services/local/local_storage_preferences_service.dart';

class LocalStoragePrefRepository {
  final LocalStoragePreferencesService localStoragePrefService;

  LocalStoragePrefRepository({
    required this.localStoragePrefService,
  });

  FutureOr<void> hideSplashPageToStartup() async =>
      await localStoragePrefService.hideSplashPageToStartup();

  FutureOr<void> showSplashPageToStartup() async =>
      await localStoragePrefService.showSplashPageToStartup();

  Future<bool?> get showSplashPage async =>
      await localStoragePrefService.showSplashPage;
}
