import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlashMessage {
  static showToggleFavoriteJobOffer(bool isAdded, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(isAdded ? AppLocalizations.of(context)!.jobOfferAddedToFavorites : AppLocalizations.of(context)!.jobOfferRemovedFromFavorites,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary)
      )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}