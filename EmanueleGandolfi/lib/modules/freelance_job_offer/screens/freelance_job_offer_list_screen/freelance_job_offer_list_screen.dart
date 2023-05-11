import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:offertelavoroflutter_app/constants/routes.dart';
import 'package:offertelavoroflutter_app/helpers/flash_message.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/error_indicator.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/header_with_search.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/multi_animation.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/no_item_found_indicator.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer/freelance_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer_filters/freelance_job_offer_filters.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/repositories/freelance_job_offer_repository.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/screens/freelance_job_offer_detail_screen/freelance_job_offer_detail_screen.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/screens/freelance_job_offer_list_screen/bloc/freelance_job_offer_list_screen_bloc.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/freelance_job_offer_item.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/freelance_job_offer_filter_sheet/freelance_job_offer_filter_sheet.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/freelance_job_offer_item_skeleton.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/freelance_job_offer_subscribe_newsletter_sheet.dart';
import 'package:offertelavoroflutter_app/modules/job_offer/screens/job_offers_screen/job_offers_screen.dart';
import 'package:offertelavoroflutter_app/modules/job_offer/widgets/subscribe_job_offer_newsletter_cta.dart';
import 'package:rxdart/rxdart.dart';

class FreelanceJobOfferListScreen extends StatelessWidget {
  final Function() onSwitchList;
  final ValueStream<bool> animationStream;
  const FreelanceJobOfferListScreen({Key? key, required this.onSwitchList,
    required this.animationStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FreelanceJobOfferListScreenBloc(freelanceJobOfferRepository: RepositoryProvider.of<FreelanceJobOfferRepository>(context)),
      child: _FreelanceJobOfferListView(
        onSwitchList: onSwitchList,
        animationStream: animationStream,
      ),
    );
  }
}

class _FreelanceJobOfferListView extends StatefulWidget {
  final Function() onSwitchList;
  final ValueStream<bool> animationStream;
  const _FreelanceJobOfferListView({Key? key, required this.onSwitchList,
    required this.animationStream}) : super(key: key);

  @override
  State<_FreelanceJobOfferListView> createState() => _FreelanceJobOfferListViewState();
}

class _FreelanceJobOfferListViewState extends State<_FreelanceJobOfferListView> with TickerProviderStateMixin {
  final TextEditingController _searchFieldController = TextEditingController();
  final PagingController<String?, FreelanceJobOffer> _pagingController = PagingController(firstPageKey: null);
  late AnimationController _headerAnimController;
  late AnimationController _listAnimController;
  late StreamSubscription<bool> _animationStreamSub;

  @override
  void initState() {
    _headerAnimController = AnimationController(vsync: this, duration: JobOffersScreen.animationsDuration);
    _listAnimController = AnimationController(vsync: this, duration: JobOffersScreen.animationsDuration);
    _animationStreamSub = widget.animationStream.listen(_onAnimationEvent);
    _pagingController.addStatusListener(_onPagingStatusChange);
    _pagingController.addPageRequestListener((pageKey) {
      context.read<FreelanceJobOfferListScreenBloc>().add(FreelanceJobOfferListScreenEvent.pageRequested(pageKey));
    });
    _searchFieldController.addListener(() {
      context.read<FreelanceJobOfferListScreenBloc>().add(FreelanceJobOfferListScreenEvent.searchQueryChanged(_searchFieldController.text));
    });
    super.initState();
  }

  @override
  void dispose() {
    _headerAnimController.dispose();
    _listAnimController.dispose();
    _animationStreamSub.cancel();
    _searchFieldController.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  _onAnimationEvent(bool animateIn) {
    if(animateIn) {
      _headerAnimController.forward();
      // we run the list animation only if it's not loading the first page
      if(_pagingController.value.status != PagingStatus.loadingFirstPage) {
        _listAnimController.forward();
      }
    } else {
      _headerAnimController.reverse();
      _listAnimController.reverse();
    }
  }

  _onPagingStatusChange(PagingStatus pagingStatus) {
    if(pagingStatus != PagingStatus.loadingFirstPage) {
      // we check if we should animate-in the list by reading the current value of the animation stream
      bool shouldAnimate = widget.animationStream.hasValue && widget.animationStream.value;
      if(shouldAnimate) {
        _listAnimController.forward();
      }
    } else {
      // when we are loading the first page we reset the animation (useful for re-executing the animation on refresh)
      _listAnimController.reset();
    }
  }

  showFiltersSheet(FreelanceJobOfferFilters initialFilters) async {
    FreelanceJobOfferFilters? filters = await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => FreelanceJobOfferFilterSheet(initialFilters: initialFilters),
    );
    
    if(filters == null) return;
    context.read<FreelanceJobOfferListScreenBloc>().add(FreelanceJobOfferListScreenEvent.filtersChanged(filters));
  }

  showSubscribeNewsletterSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const FreelanceJobOfferSubscribeNewsletterSheet(),
    );
  }

  refresh() {
    context.read<FreelanceJobOfferListScreenBloc>().add(const FreelanceJobOfferListScreenEvent.refreshRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FreelanceJobOfferListScreenBloc, FreelanceJobOfferListScreenState>(
      listener: (context, state) => _pagingController.value = state.pagingState,
      builder: (context, state) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              HeaderWithSearch(
                forceElevated: innerBoxIsScrolled,
                title: AppLocalizations.of(context)!.freelanceJobOfferScreenTitle,
                switchListBtnTitle: AppLocalizations.of(context)!.freelanceJobOfferScreenSwitch,
                searchController: _searchFieldController,
                animationController: _headerAnimController,
                onSwitchList: widget.onSwitchList,
                showActiveFiltersBadge: state.filters.active,
                onShowFilters: () => showFiltersSheet(state.filters),
              )
            ];
          },
          body: RefreshIndicator(
            onRefresh: () => Future.sync(refresh),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SubscribeJobOfferNewsletterCta(onTap: showSubscribeNewsletterSheet),
                  ),
                ),
                PagedSliverList(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<FreelanceJobOffer>(
                    itemBuilder: (context, item, index) => _buildItem(index, item, state),
                    firstPageProgressIndicatorBuilder: (context) => _buildFirstPageProgressIndicator(),
                    newPageProgressIndicatorBuilder: (context) => const FreelanceJobOfferItemSkeleton(),
                    noItemsFoundIndicatorBuilder: (context) => const NoItemsFoundIndicator(),
                    firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(onRetry: refresh),
                    newPageErrorIndicatorBuilder: (context) => ErrorIndicator(onRetry: refresh),
                  )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(int index, FreelanceJobOffer freelanceJobOffer, FreelanceJobOfferListScreenState state) {
    bool isFavorite = state.favoriteFreelanceJobOfferIds.contains(freelanceJobOffer.id);
    double initialDelay = min(index, 2) * 0.1;
    return MultiAnimation(
      controller: _listAnimController,
      beginOffset: const Offset(0, 0.2),
      beginInterval: initialDelay,
      endInterval: initialDelay + 0.5,
      child: FreelanceJobOfferItem(
        freelanceJobOffer: freelanceJobOffer,
        onTap: () => Navigator.of(context).pushNamed(Routes.freelanceJobOfferDetail,
          arguments: FreelanceJobOfferDetailScreenArgs(freelanceJobOffer: freelanceJobOffer)
        ),
        isFavorite: isFavorite,
        onFavoriteTap: () {
          context.read<FreelanceJobOfferListScreenBloc>()
            .add(FreelanceJobOfferListScreenEvent.favoriteFreelanceJobOfferToggled(freelanceJobOffer.id));

          FlashMessage.showToggleFavoriteJobOffer(!isFavorite, context);
        }
      ),
    );
  }

  Widget _buildFirstPageProgressIndicator() {
    return Column(
      children: const [
        FreelanceJobOfferItemSkeleton(),
        FreelanceJobOfferItemSkeleton(),
        FreelanceJobOfferItemSkeleton(),
        FreelanceJobOfferItemSkeleton(),
        FreelanceJobOfferItemSkeleton(),
        FreelanceJobOfferItemSkeleton(),
      ],
    );
  }
}


