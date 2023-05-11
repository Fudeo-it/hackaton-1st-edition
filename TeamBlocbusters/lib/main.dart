import 'package:fudeo_hackaton/app/app.dart';
import 'package:fudeo_hackaton/bootstrap.dart';

void main() {
  bootstrap(
    builder: (
      jobOfferRepository,
      socialShareRepository,
      favouriteRepository,
    ) =>
        App(
      jobOfferRepository: jobOfferRepository,
      socialShareRepository: socialShareRepository,
      favouritesRepository: favouriteRepository,
    ),
  );
}
