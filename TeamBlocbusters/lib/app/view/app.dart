import 'package:favourites_repository/favourites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/onboarding/onboarding.dart';
import 'package:job_offer_repository/job_offer_repository.dart';
import 'package:social_share_repository/social_share_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required JobOfferRepository jobOfferRepository,
    required SocialShareRepository socialShareRepository,
    required FavouritesRepository favouritesRepository,
  })  : _jobOfferRepository = jobOfferRepository,
        _socialShareRepository = socialShareRepository,
        _favouritesRepository = favouritesRepository;

  final FavouritesRepository _favouritesRepository;
  final JobOfferRepository _jobOfferRepository;
  final SocialShareRepository _socialShareRepository;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _jobOfferRepository),
        RepositoryProvider.value(value: _socialShareRepository),
        RepositoryProvider.value(value: _favouritesRepository)
      ],
      child: MaterialApp(
        home: OnboardingPage(
          jobOfferRepository: _jobOfferRepository,
        ),
      ),
    );
  }
}
