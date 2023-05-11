import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/blocs/favorite_job_offers/favorite_job_offers_bloc.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/ui/components/empty_state.dart';
import 'package:offertelavoroflutter/ui/components/job_offer_card.dart';
import 'package:offertelavoroflutter/ui/theme/colors.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static const route = '/favorites';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<FavoriteJobOffersBloc, FavoriteJobOffersState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(l10n.titleOffersSaved(state.jobOfferFavorites.length)),
          backgroundColor: ThemeColors.primaryDark,
          actions: [
            IconButton(
              onPressed: () {
                if (state.jobOfferFavorites.isEmpty) return;
                context.read<FavoriteJobOffersBloc>().add(ClearFavoritesList());
                ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(l10n.messageListEmptied),
                    backgroundColor: Colors.green,
                  )
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: BlocBuilder<FavoriteJobOffersBloc, FavoriteJobOffersState>(
        builder:(context, state) {
          if (state.jobOfferFavorites.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: EmptyState(
                  message: l10n.emptyFavoritesList,
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: state.jobOfferFavorites.length,
              itemBuilder: (context, index) => Column(
                children: [
                  JobOfferCardComponent(jobOffer: state.jobOfferFavorites[index]),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}