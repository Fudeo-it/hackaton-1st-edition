part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
  Provider<Logger>(
    create: (_) => Logger(),
  ),
  Provider<JobsService>(
    create: (_) => JobsService(baseUrl: "https://api.notion.com/v1"),
  ),
  Provider<FlutterSecureStorage>(
    create: (_) => const FlutterSecureStorage(),
  ),
  Provider<LocalStoragePreferencesService>(
    create: (_) => LocalStoragePreferencesService(
      sharedPrefFuture: SharedPreferences.getInstance(),
    ),
  ),
  Provider<UrlLauunchService>(
    create: (_) => UrlLauunchService(),
  ),
  Provider<ShareJobService>(
    create: (_) => ShareJobService(),
  ),
];
