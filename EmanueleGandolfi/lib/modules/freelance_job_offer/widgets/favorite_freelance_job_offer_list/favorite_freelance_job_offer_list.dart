import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/constants/routes.dart';
import 'package:offertelavoroflutter_app/helpers/flash_message.dart';
import 'package:offertelavoroflutter_app/helpers/loading_state.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/error_indicator.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/no_item_found_indicator.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer/freelance_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/repositories/freelance_job_offer_repository.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/screens/freelance_job_offer_detail_screen/freelance_job_offer_detail_screen.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/favorite_freelance_job_offer_list/bloc/favorite_freelance_job_offer_list_bloc.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/freelance_job_offer_item.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/freelance_job_offer_item_skeleton.dart';

class FavoriteFreelanceJobOfferList extends StatelessWidget {
  const FavoriteFreelanceJobOfferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteFreelanceJobOfferListBloc(freelanceJobOfferRepository: RepositoryProvider.of<FreelanceJobOfferRepository>(context))
        ..add(const FavoriteFreelanceJobOfferListEvent.loadRequested()),
      child: const _FavoriteFreelanceJobOfferListView(),
    );
  }
}

class _FavoriteFreelanceJobOfferListView extends StatelessWidget {
  const _FavoriteFreelanceJobOfferListView({Key? key}) : super(key: key);

  refresh(BuildContext context) {
    context.read<FavoriteFreelanceJobOfferListBloc>().add(const FavoriteFreelanceJobOfferListEvent.loadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteFreelanceJobOfferListBloc, FavoriteFreelanceJobOfferListState>(
      builder: (context, state) {
        switch(state.loadingState.status) {
          case LoadingStatus.initial:
          case LoadingStatus.inProgress:
            return _buildFirstPageProgressIndicator();

          case LoadingStatus.error:
            return ErrorIndicator(onRetry: () => refresh(context));

          case LoadingStatus.done:
            List<FreelanceJobOffer> items = state.loadingState.items!;
            if(items.isEmpty) return const NoItemsFoundIndicator();

            return RefreshIndicator(
              onRefresh: () => Future.sync(() => refresh(context)),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 16),
                itemCount: items.length,
                itemBuilder: (context, index) => _buildItem(items[index], state, context),
              ),
            );
        }
      },
    );
  }

  Widget _buildItem(FreelanceJobOffer freelanceJobOffer, FavoriteFreelanceJobOfferListState state, BuildContext context) {
    bool isFavorite = state.favoriteFreelanceJobOfferIds.contains(freelanceJobOffer.id);
    String heroTag = 'favorite-${freelanceJobOffer.id}';

    return FreelanceJobOfferItem(
      heroTag: heroTag,
      freelanceJobOffer: freelanceJobOffer,
      onTap: () => Navigator.of(context).pushNamed(Routes.freelanceJobOfferDetail,
        arguments: FreelanceJobOfferDetailScreenArgs(freelanceJobOffer: freelanceJobOffer, heroTag: heroTag)
      ),
      isFavorite: isFavorite,
      onFavoriteTap: () {
        context.read<FavoriteFreelanceJobOfferListBloc>()
          .add(FavoriteFreelanceJobOfferListEvent.favoriteFreelanceJobOfferToggled(freelanceJobOffer.id));

        FlashMessage.showToggleFavoriteJobOffer(!isFavorite, context);
      }
    );
  }

  Widget _buildFirstPageProgressIndicator() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: const [
          FreelanceJobOfferItemSkeleton(),
          FreelanceJobOfferItemSkeleton(),
          FreelanceJobOfferItemSkeleton(),
          FreelanceJobOfferItemSkeleton(),
          FreelanceJobOfferItemSkeleton(),
          FreelanceJobOfferItemSkeleton(),
        ],
      ),
    );
  }
}
