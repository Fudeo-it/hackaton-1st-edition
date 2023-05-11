part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<JobRepository>(
    create: (context) => JobRepository(
      service: context.read<JobsService>(),
      jobOffersMapper: context.read<JobOffersMapper>(),
      jobProjectsMapper: context.read<JobProjectsMapper>(),
      secureStorage: context.read<FlutterSecureStorage>(),
    ),
  ),
  RepositoryProvider<LocalStoragePrefRepository>(
    create: (context) => LocalStoragePrefRepository(
      localStoragePrefService: context.read<LocalStoragePreferencesService>(),
    ),
  ),
  RepositoryProvider<ShareJobRepository>(
    create: (context) => ShareJobRepository(
      shareJovService: context.read<ShareJobService>(),
    ),
  ),
];
