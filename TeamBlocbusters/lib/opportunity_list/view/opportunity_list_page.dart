import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/opportunity_detail/opportunity_detail.dart';
import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/filters_dialog/components/components.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/widget.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:fudeo_hackaton/widget/opportunity_card.dart';
import 'package:job_offer_repository/job_offer_repository.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OpportunityListPage extends StatelessWidget {
  const OpportunityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            PhosphorIcons.regular.caretLeft,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Annunci',
          style: AppFonts.jobListAppBar,
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: BlocProvider(
        create: (context) => OpportunityListBloc(
          jobOfferRepository: context.read<JobOfferRepository>(),
          openJobOfferDetailPage: (jobOffer) => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => JobOfferDetailPage(
                jobOffer: jobOffer,
              ),
            ),
          ),
          openFreelanceDetailPage: (project) => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => ProjectDetailPage(
                project: project,
              ),
            ),
          ),
          openFilterDialog: (bloc) => JobOfferListFilterDialog.show(
            context,
            bloc,
          ),
        ),
        child: const OpportunityListView(),
      ),
    );
  }
}

class OpportunityListView extends StatelessWidget {
  const OpportunityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      color: AppColors.white,
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: OpportunityTypeToggle(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Filters(),
          ),
          Expanded(
            child: OpportunityListContent(),
          )
        ],
      ),
    );
  }
}

class OpportunityListContent extends StatelessWidget {
  const OpportunityListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OpportunityListBloc>();
    return BlocBuilder<OpportunityListBloc, OpportunityListState>(
      builder: (context, state) => state.filteredOpportunities.isNotEmpty
          ? ListView(
              children: List.of(
                state.filteredOpportunities.map(
                  (o) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    child: OpportunityCard(
                      opportunity: o,
                      onTap: () => bloc.add(OpportunityTap(o)),
                    ),
                  ),
                ),
              ),
            )
          : const NoResultsMessage(),
    );
  }
}
