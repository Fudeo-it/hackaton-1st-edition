import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/blocs/favorite_job_offers/favorite_job_offers_bloc.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/repositories/notion/databases_repository.dart';
import 'package:offertelavoroflutter/repositories/notion/mappers/freelance_page_mapper.dart';
import 'package:offertelavoroflutter/repositories/notion/mappers/recruitment_page_mapper.dart';
import 'package:offertelavoroflutter/services/local_storage_job_offers.dart';
import 'package:offertelavoroflutter/services/network/notion/databases_service.dart';
import 'package:offertelavoroflutter/ui/pages/freelance/freelance_details_page.dart';
import 'package:offertelavoroflutter/ui/pages/navigation_page.dart';
import 'package:offertelavoroflutter/ui/pages/recruitment/recruitment_details_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    required this.localStorage,
    super.key
  });

  final LocalStorageJobOffers localStorage;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RecruitmentPageMapper>(
          create: (_) => RecruitmentPageMapper(),
        ),
        Provider<FreelancePageMapper>(
          create: (_) => FreelancePageMapper(),
        ),
        Provider<DatabasesService>(
          create: (_) => DatabasesService(),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<DatabasesRepository>(
            create: (context) => DatabasesRepository(
              databasesService: context.read<DatabasesService>(),
              recruitmentPageMapper: context.read<RecruitmentPageMapper>(),
              freelancePageMapper: context.read<FreelancePageMapper>(),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<FavoriteJobOffersBloc>(
              create: (context) => FavoriteJobOffersBloc(
                localStorageJobOffers: localStorage,
              )..add(FavoriteJobOfferFetching())
            ),
          ],
          child: MaterialApp(
            title: 'Offerte di lavoro flutter',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Montserrat',
              //primaryColorDark: ThemeColors.primaryDark,
            ),
            initialRoute: NavigationPage.route,
            onGenerateRoute: (settings) {
              final routes = {
                NavigationPage.route: (context) => const NavigationPage(),
                RecruitmentDetailsPage.route:(context) => RecruitmentDetailsPage(
                  args: settings.arguments as RecruitmentPageArgs,
                ),
                FreelanceDetailsPage.route:(context) => FreelanceDetailsPage(
                  args: settings.arguments as FreelancePageArgs,
                ),
              };
              return MaterialPageRoute(builder: routes[settings.name]!);
            },
          ),
        ),
      ),
    );
  }
}