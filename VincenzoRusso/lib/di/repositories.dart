part of 'dependency_injector.dart';

List<RepositoryProvider> _repositories = [
  RepositoryProvider<JobRepository>(
    create: (context) => JobRepository(
      jobService: context.read<JobService>(),
      jobMapper: context.read<JobMapper>(),
      freelanceMapper: context.read<FreelanceMapper>(),
      filtersMapper: context.read<FiltersMapper>(),
      sortsMapper: context.read<SortsMapper>(),
      logger: context.read<Logger>(),
    ),
  ),
  RepositoryProvider<FavouriteRepository>(
    create: (_) => FavouriteRepository(),
  ),
  RepositoryProvider<UrlLauncherRepository>(
    create: (_) => const UrlLauncherRepository(),
  ),
];
