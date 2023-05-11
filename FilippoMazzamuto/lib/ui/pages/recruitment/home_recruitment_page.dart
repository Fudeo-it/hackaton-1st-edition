import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/blocs/job_offers/job_offers_bloc.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:offertelavoroflutter/repositories/notion/databases_repository.dart';
import 'package:offertelavoroflutter/ui/components/app_bar.dart';
import 'package:offertelavoroflutter/ui/components/bottom_loader.dart';
import 'package:offertelavoroflutter/ui/components/empty_state.dart';
import 'package:offertelavoroflutter/ui/components/filters.dart';
import 'package:offertelavoroflutter/ui/components/job_offer_card.dart';

class HomeRecruitmentPage extends StatelessWidget {
  const HomeRecruitmentPage({super.key});
  static const String nameRequest = 'recruitment';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JobOffersBloc>(
      create: (context) => 
      JobOffersBloc(databasesRepository: context.read<DatabasesRepository>())
      ..fetchJobOffers(nameRequest), // Valutare se passargli il parametro per il tipo di database
      child: const HomeRecruitmentView(),
    );
  }
}

class HomeRecruitmentView extends StatefulWidget {
  const HomeRecruitmentView({super.key});

  @override
  State<HomeRecruitmentView> createState() => _HomeRecruitmentViewState();
}

class _HomeRecruitmentViewState extends State<HomeRecruitmentView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBarComponent(
        title: l10n.recruitmentTitle,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<JobOffersBloc>().add(const RefreshRequested());
        },
        child: MultiBlocListener(
          listeners: [
            BlocListener<JobOffersBloc, JobOffersState>(
              listenWhen: (previous, current) => 
                previous.status != current.status,
              listener:(context, state) {
                if (state.status == JobOffersStatus.failure) {
                  ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(l10n.errorMessage(state.errorMessage)),
                      backgroundColor: Colors.red,
                    )
                  );
                }
              },
            ),
            BlocListener<JobOffersBloc, JobOffersState>(
              listenWhen: (previous, current) => 
                current.status == JobOffersStatus.initial,
              listener:(context, state) {
                if (state.status == JobOffersStatus.initial) {
                  // Eseguiamo il fetch ogni qual volta che lo stato si trova su initial
                  context.read<JobOffersBloc>().add(const JobOffersSubscriptionRequested(
                    nameRequest: HomeRecruitmentPage.nameRequest
                  ));
                }
              },
            )
          ],
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // TODO: Implementare altre parti grafiche UI
              //sectionHeader(),
              const Filters(targetJobOffer: TargetJobOffer.recruitment),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: sectionJobOffersBuilder(l10n: l10n),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<JobOffersBloc, JobOffersState>(
        builder: (context, state) {
          if (state.allActiveFilters.isNotEmpty) {
            if (state.status == JobOffersStatus.success) {
              return FloatingActionButton.extended(
                onPressed: () {
                  context.read<JobOffersBloc>().add(const JobOffersClearAllFilters());
                },
                backgroundColor: Colors.red,
                label: Text(l10n.removeFilters),
                icon: const Icon(Icons.delete),
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final bloc = context.read<JobOffersBloc>();
    if (_isBottom && !bloc.loadingScrollPage && bloc.state.nextCursor != null) {
      context.read<JobOffersBloc>().add(const JobOffersSubscriptionRequested(
        nameRequest: HomeRecruitmentPage.nameRequest
      ));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  /// Content header
  SliverToBoxAdapter sectionHeader() => SliverToBoxAdapter(
    child: Container(
      width: double.infinity,
      height: 200,
      color: Colors.black,
    ),
  );

  /// Section list view card job offers
  BlocBuilder sectionJobOffersBuilder({required AppLocalizations l10n}) => BlocBuilder<JobOffersBloc, JobOffersState>(
    builder:(context, state) {
      if (state.jobOffers.isEmpty) {
        if (state.status == JobOffersStatus.loading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 5,
              (context, index) => Column(
                children: const [
                  JobOfferCardComponent(),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          );
        } else if (state.status != JobOffersStatus.success) {
          return const SliverToBoxAdapter();
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: EmptyState(
                message: l10n.jobOffersNotAvailable,
              ),
            ),
          );
        }
      }
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: state.hasMore
          ? state.jobOffers.length + 1
          : state.jobOffers.length,
          (context, index) => index >= state.jobOffers.length
          ? const BottomLoaderComponent()
          : Column(
              children: [
                JobOfferCardComponent(jobOffer: state.jobOffers[index] as Recruitment),
                const SizedBox(height: 16.0),
              ],
            ),
        ),
      );
    },
  );
}
