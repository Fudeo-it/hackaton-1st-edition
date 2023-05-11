import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/blocs/jobs/jobs_bloc.dart';
import 'package:offertelavoroflutter/cubits/cubits.dart';
import 'package:offertelavoroflutter/repositories/repositories.dart';
import 'package:offertelavoroflutter/services/network.dart';
import 'package:offertelavoroflutter/services/storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjector extends StatelessWidget {
  const DependencyInjector({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _providers(child: _repositories(child: _blocs(child)));
  }

  Widget _blocs(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JobsBloc>(
          create: (context) => JobsBloc(
            jobRepository: context.read<JobRepository>(),
            storage: context.read<Storage>(),
          )..add(const JobsGet()),
        ),
        BlocProvider<FiltersCubit>(
          create: (context) => FiltersCubit(),
        ),
      ],
      child: child,
    );
  }

  Widget _providers({required Widget child}) {
    return MultiProvider(
      providers: [
        Provider<Api>(
          create: (context) => Api(),
        ),
        Provider<Storage>(
          create: (context) => Storage(
            sharedPrefs: SharedPreferences.getInstance(),
          ),
        ),
      ],
      child: child,
    );
  }

  _repositories({required Widget child}) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => JobRepository(
            api: context.read<Api>(),
            storage: context.read<Storage>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
