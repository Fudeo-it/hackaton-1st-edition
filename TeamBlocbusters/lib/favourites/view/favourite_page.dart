import 'package:favourites_repository/favourites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/favourites/bloc/favourites_bloc.dart';
import 'package:fudeo_hackaton/favourites/widget/no_favourites_message.dart';
import 'package:fudeo_hackaton/opportunity_detail/opportunity_detail.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:fudeo_hackaton/widget/opportunity_card.dart';
import 'package:job_offer_repository/job_offer_repository.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Annunci salvati',
          style: AppFonts.jobListAppBar,
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: BlocProvider(
        create: (context) => FavouritesBloc(
          jobOfferRepository: context.read<JobOfferRepository>(),
          favouritesRepository: context.read<FavouritesRepository>(),
          openFreelanceCallback: (project) => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => ProjectDetailPage(
                project: project,
              ),
            ),
          ),
          openJobOfferCallback: (jobOffer) => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => JobOfferDetailPage(
                jobOffer: jobOffer,
              ),
            ),
          ),
        ),
        child: const FavouriteListView(),
      ),
    );
  }
}

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FavouritesBloc>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      color: AppColors.white,
      child: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) => state.favouriteOpportunities.isNotEmpty
            ? ListView(
                children: List.of(
                  state.favouriteOpportunities.map(
                    (o) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: OpportunityCard(
                        opportunity: o,
                        onTap: () => bloc.add(FavoriteTap(o)),
                      ),
                    ),
                  ),
                ),
              )
            : const NoFavouritesMessage(),
      ),
    );
  }
}
