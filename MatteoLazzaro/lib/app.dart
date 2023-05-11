import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/misc/colors.dart';
import 'package:offertelavoroflutter/pages/main_page.dart';
import 'package:offertelavoroflutter/repositories/jobs_repository.dart';
import 'package:offertelavoroflutter/repositories/mappers/job_mapper.dart';
import 'package:offertelavoroflutter/services/network/jobs_service.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        mappers: [
          Provider<JobMapper>(
            create: (_) => JobMapper(),
          )
        ],
        providers: [
          Provider<JobsService>(
            create: (_) => JobsService(),
          ),
        ],
        repositories: [
          RepositoryProvider<JobsRepository>(
            create: (context) => JobsRepository(
              jobsService: context.read<JobsService>(),
              jobMapper: context.read<JobMapper>(),
            ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jobs',
          theme: ThemeData(
            primarySwatch: MaterialColor(0xFF027DFD, color),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.indigo,
              elevation: 5,
            ),
          ),
          home: const MainPage(),
        ),
      );
}
