import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:favourites_repository/favourites_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:fudeo_api/fudeo_api.dart';
import 'package:job_offer_repository/job_offer_repository.dart';
import 'package:local_storage/local_storage.dart';
import 'package:social_share_repository/social_share_repository.dart';
import 'package:timeago/timeago.dart' as timeago;

typedef AppBuilder = FutureOr<Widget> Function(
  JobOfferRepository jobOfferRepository,
  SocialShareRepository socialShareRepository,
  FavouritesRepository favouritesRepository,
);

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap({required AppBuilder builder}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  timeago.setLocaleMessages('it', timeago.ItMessages());

  Bloc.observer = const AppBlocObserver();

  final fudeoAPI = FudeoAPI();
  final localStorage = LocalStorage();
  final jobOfferRepository = JobOfferRepository(fudeoAPI: fudeoAPI);
  final socialShareRepository = SocialShareRepository();
  final favouritesRepository = FavouritesRepository(localStorage: localStorage);

  await runZonedGuarded(
    () async => runApp(
      await builder(
        jobOfferRepository,
        socialShareRepository,
        favouritesRepository,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
