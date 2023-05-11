part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<ThemeCubit>(
    create: (_) => ThemeCubit(),
  ),
  BlocProvider<ShowSplashPageCubit>(
    create: (context) => ShowSplashPageCubit(
      localStoragePrefRepository: context.read<LocalStoragePrefRepository>(),
    )..getShowSpashPagePref(),
  ),
  BlocProvider<JobOffersBloc>(
    create: (context) => JobOffersBloc(
      jobRepository: context.read<JobRepository>(),
    )..fetchJobs(),
  ),
  BlocProvider<JobProjectsBloc>(
    create: (context) => JobProjectsBloc(
      jobRepository: context.read<JobRepository>(),
    )..fetchProjects(),
  ),
  BlocProvider<SplashPagePrefBloc>(
    create: (context) => SplashPagePrefBloc(
      localStoragePrefRepository: context.read<LocalStoragePrefRepository>(),
      showSpalshPageCubit: context.read<ShowSplashPageCubit>(),
    )..fetchSplashPagePref(),
  ),
  BlocProvider<ShareJobCubit>(
    create: (context) => ShareJobCubit(
      shareJobRepository: context.read<ShareJobRepository>(),
    ),
  ),
  BlocProvider<BookmarkSaveCubit>(
    create: (context) => BookmarkSaveCubit(
      jobRepository: context.read<JobRepository>(),
    ),
  ),
];
