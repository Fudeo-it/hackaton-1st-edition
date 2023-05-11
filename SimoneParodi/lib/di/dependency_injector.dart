import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:offertelavoroflutter/blocs/freelance_project/freelance_project_bloc.dart';
import 'package:offertelavoroflutter/blocs/announcement/announcement_bloc.dart';
import 'package:offertelavoroflutter/cubits/dark_mode_cubit.dart';
import 'package:offertelavoroflutter/cubits/device_cubit.dart';
import 'package:offertelavoroflutter/cubits/favorite_mode_cubit.dart';
import 'package:offertelavoroflutter/cubits/selected_announcement_cubit.dart';
import 'package:offertelavoroflutter/cubits/selected_freelance_project_cubit.dart';
import 'package:offertelavoroflutter/repositories/job_offer_repository.dart';
import 'package:offertelavoroflutter/repositories/mapper/freelance_project_mapper.dart';
import 'package:offertelavoroflutter/repositories/mapper/announcement_mapper.dart';
import 'package:offertelavoroflutter/services/local/job_offer_local_service.dart';
import 'package:offertelavoroflutter/services/network/job_offer_network_service.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class DependecyInjector extends StatelessWidget {
  final Widget child;

  const DependecyInjector({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, boxConstraints) {
        return _mappers(
          child: _providers(
            child: _repositories(
              child: _blocs(
                child: child,
              ),
            ),
          ),
        );
      });

  Widget _mappers({
    required child,
  }) =>
      MultiProvider(
        providers: [
          Provider<AnnouncementMapper>(
            create: (_) => AnnouncementMapper(),
          ),
          Provider<FreelanceProjectMapper>(
            create: (_) => FreelanceProjectMapper(),
          ),
        ],
        child: child,
      );

  Widget _providers({
    required child,
  }) =>
      MultiProvider(
        providers: [
          Provider<Logger>(
            create: (_) => Logger(),
          ),
          Provider<JobOfferNetworkService>(
            create: (_) => const JobOfferNetworkService(
              baseUrl: 'api.notion.com',
            ),
          ),
          Provider<JobOfferLocalService>(
            create: (context) => JobOfferLocalService(
              database: context.read<Database>(),
            ),
          ),
        ],
        child: child,
      );

  Widget _repositories({
    required child,
  }) =>
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<JobOfferRepository>(
            create: (context) => JobOfferRepository(
              announcementMapper: context.read<AnnouncementMapper>(),
              freelanceProjectMapper: context.read<FreelanceProjectMapper>(),
              networkService: context.read<JobOfferNetworkService>(),
              localService: context.read<JobOfferLocalService>(),
            ),
          ),
        ],
        child: child,
      );

  Widget _blocs({required child}) => MultiBlocProvider(
        providers: [
          BlocProvider<DarkModeCubit>(
            create: (_) => DarkModeCubit(),
          ),
          BlocProvider<DeviceCubit>(
            create: (_) => DeviceCubit(),
          ),
          BlocProvider<FavoriteModeCubit>(
            create: (_) => FavoriteModeCubit(),
          ),
          BlocProvider(
            create: (context) => AnnouncementBloc(
              favoriteModeCubit: context.read<FavoriteModeCubit>(),
              jobOfferRepository: context.read<JobOfferRepository>(),
              logger: context.read<Logger>(),
            )..onFetch(),
          ),
          BlocProvider<SelectedAnnouncementCubit>(
            create: (_) => SelectedAnnouncementCubit(),
          ),
          BlocProvider(
            create: (context) => FreelanceProjectBloc(
              favoriteModeCubit: context.read<FavoriteModeCubit>(),
              jobOfferRepository: context.read<JobOfferRepository>(),
              logger: context.read<Logger>(),
            )..onFetch(),
          ),
          BlocProvider<SelectedFreelanceProjectCubit>(
            create: (_) => SelectedFreelanceProjectCubit(),
          ),
        ],
        child: child,
      );
}
