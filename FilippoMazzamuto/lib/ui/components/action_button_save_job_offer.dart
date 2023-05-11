import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/blocs/favorite_job_offers/favorite_job_offers_bloc.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';

class ActionButtonSaveJobOffer extends StatelessWidget {
  const ActionButtonSaveJobOffer({
    super.key,
    required this.jobOffer,
  });

  final JobOffer jobOffer;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<FavoriteJobOffersBloc, FavoriteJobOffersState>(
      builder:(context, state) {
        bool favorite = state.jobOfferFavorites.any((item) => item.id == jobOffer.id);
        return IconButton(
          onPressed: () {
            context.read<FavoriteJobOffersBloc>().add(FavoriteJobOfferAdd(
              jobOffer: jobOffer,
            ));
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    favorite 
                    ? l10n.removedFromFavorites
                    : l10n.addedToFavorites
                  ),
                  backgroundColor: Colors.green,
                )
              );
          },
          icon: Icon(
            favorite 
            ? Icons.bookmark_added_outlined
            : Icons.bookmark_add_outlined 
          ),
          iconSize: 30.0,
          color: favorite ? Colors.yellow.shade900 : null,
        );
      }
    );
  }

}