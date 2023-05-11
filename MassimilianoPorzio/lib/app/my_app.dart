import 'package:device_preview/device_preview.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/connection.dart';
import 'package:job_app/features/aziende/domain/usecases/annunci_azienda_params.dart';

import 'package:job_app/features/aziende/presentation/cubit/annunci/aziende_cubit.dart';
import 'package:job_app/features/aziende/presentation/cubit/filters/aziende_filter_cubit.dart';
import 'package:job_app/features/freelancers/domain/usecases/annunci_freelancer_params.dart';
import 'package:job_app/features/freelancers/presentation/cubit/annunci/freelancers_cubit.dart';
import 'package:job_app/features/freelancers/presentation/cubit/filters/freelancers_filters_cubit.dart';
import 'package:job_app/features/freelancers/presentation/pages/dettagli_annuncio_freelancers.dart';
import 'package:job_app/features/preferiti/presentation/cubit/annunci/preferiti_cubit.dart';
import 'package:job_app/features/preferiti/presentation/cubit/filters/preferiti_filters_cubit.dart';

import 'package:loggy/loggy.dart';

import '../core/services/service_locator.dart';
import '../features/aziende/presentation/pages/dettagli_annuncio_aziende.dart';
import 'presentation/cubit/dark_mode/dark_mode_cubit.dart';
import 'presentation/cubit/navbar/navigation_cubit.dart';
import 'presentation/cubit/sound/sound_cubit.dart';
import 'presentation/pages/splash_screen.dart';
import 'resources/color_manager.dart';
import 'resources/font_manager.dart';
import 'resources/theme_manager.dart';

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    // precacheImage(
    //     const AssetImage("assets/images/splashBackground.jpg"), context);
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        locale: DevicePreview.locale(context),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //dipende dallo stato del cubit DarkModeCubit
        themeMode: context.watch<DarkModeCubit>().state.mode,
        // theme: ThemeManager.getLightTheme(lightDynamic),
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: FontConstants.fontFamily,
            // appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade200),
            colorScheme: lightDynamic ?? ColorManager.defaultLightColorScheme),
        darkTheme: ThemeManager.getDarkTheme(darkDynamic),
        home: const SplashScreen(),
        routes: {
          DettaglioAnnunciAziende.routeName: (context) =>
              const DettaglioAnnunciAziende(),
          DettaglioAnnunciFreelancers.routeName: (context) =>
              const DettaglioAnnunciFreelancers()
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PreferitiFiltersCubit>(
        create: (context) => sl<PreferitiFiltersCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<FreelancersFiltersCubit>(),
      ),
      BlocProvider<AziendeFilterCubit>(
          create: (context) => sl<AziendeFilterCubit>()),
      BlocProvider<SoundCubit>(
        create: (context) => sl<SoundCubit>(),
      ),
      BlocProvider<DarkModeCubit>(
        create: (context) => sl<DarkModeCubit>(),
      ),
      BlocProvider<NavigationCubit>(
        create: (context) => sl<NavigationCubit>(),
      ),
      BlocProvider(
        create: (_) => ConnectionBloc(
          sl<ConnectionRepository>(),
        ),
      ),
      BlocProvider<AziendeCubit>(
        create: (context) {
          var aziendeCubit = sl<AziendeCubit>();
          //qui so che è initial
          if (aziendeCubit.state.listaAnnunci.isEmpty) {
            //
            logDebug("...state is empty: loadAnnunci...");
            aziendeCubit.loadAnnunci(AnnunciAzParams.empty());
          }
          return aziendeCubit;
        },
      ),
      BlocProvider<FreelancersCubit>(
        create: (context) {
          var freelancersCubit = sl<FreelancersCubit>();
          //initial lista vuota quindi carico
          if (freelancersCubit.state.listaAnnunci.isEmpty) {
            freelancersCubit.loadAnnunci(AnnunciFreelancersParams.empty());
          }
          return freelancersCubit;
        },
      ),
      BlocProvider<PreferitiCubit>(create: (context) => sl<PreferitiCubit>())
    ], child: const JobApp());
  }
}
