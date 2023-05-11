import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/constants/routes.dart';
import 'package:offertelavoroflutter_app/helpers/flash_message.dart';
import 'package:offertelavoroflutter_app/helpers/loading_state.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/error_indicator.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/no_item_found_indicator.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer/hiring_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/repositories/hiring_job_offer_repository.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/screens/hiring_job_offer_detail_screen/hiring_job_offer_detail_screen.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/widgets/favorite_hiring_job_offer_list/bloc/favorite_hiring_job_offer_list_bloc.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/widgets/hiring_job_offer_item.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/widgets/hiring_job_offer_item_skeleton.dart';

class FavoriteHiringJobOfferList extends StatelessWidget {
  const FavoriteHiringJobOfferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteHiringJobOfferListBloc(hiringJobOfferRepository: RepositoryProvider.of<HiringJobOfferRepository>(context))
        ..add(const FavoriteHiringJobOfferListEvent.loadRequested()),
      child: const _FavoriteHiringJobOfferListView(),
    );
  }
}

class _FavoriteHiringJobOfferListView extends StatelessWidget {
  const _FavoriteHiringJobOfferListView({Key? key}) : super(key: key);

  refresh(BuildContext context) {
    context.read<FavoriteHiringJobOfferListBloc>().add(const FavoriteHiringJobOfferListEvent.loadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteHiringJobOfferListBloc, FavoriteHiringJobOfferListState>(
      builder: (context, state) {
        switch(state.loadingState.status) {
          case LoadingStatus.initial:
          case LoadingStatus.inProgress:
            return _buildFirstPageProgressIndicator();

          case LoadingStatus.error:
            return ErrorIndicator(onRetry: () => refresh(context));

          case LoadingStatus.done:
            List<HiringJobOffer> items = state.loadingState.items!;
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

  Widget _buildItem(HiringJobOffer hiringJobOffer, FavoriteHiringJobOfferListState state, BuildContext context) {
    bool isFavorite = state.favoriteHiringJobOfferIds.contains(hiringJobOffer.id);
    String heroTag = 'favorite-${hiringJobOffer.id}';

    return HiringJobOfferItem(
      heroTag: heroTag,
      hiringJobOffer: hiringJobOffer,
      onTap: () => Navigator.of(context).pushNamed(Routes.hiringJobOfferDetail,
        arguments: HiringJobOfferDetailScreenArgs(hiringJobOffer: hiringJobOffer, heroTag: heroTag)
      ),
      isFavorite: isFavorite,
      onFavoriteTap: () {
        context.read<FavoriteHiringJobOfferListBloc>()
          .add(FavoriteHiringJobOfferListEvent.favoriteHiringJobOfferToggled(hiringJobOffer.id));

        FlashMessage.showToggleFavoriteJobOffer(!isFavorite, context);
      }
    );
  }

  Widget _buildFirstPageProgressIndicator() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: const [
          HiringJobOfferItemSkeleton(),
          HiringJobOfferItemSkeleton(),
          HiringJobOfferItemSkeleton(),
          HiringJobOfferItemSkeleton(),
          HiringJobOfferItemSkeleton(),
          HiringJobOfferItemSkeleton(),
        ],
      ),
    );
  }
}

