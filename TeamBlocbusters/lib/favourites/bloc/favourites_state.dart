part of 'favourites_bloc.dart';

class FavouritesState extends Equatable {
  const FavouritesState(
    this.jobOfferList,
    this.freelanceList,
    this.favouriteList,
  );

  final List<JobOffer> jobOfferList;
  final List<Freelance> freelanceList;
  final List<String> favouriteList;

  List<Opportunity> get favouriteOpportunities {
    return [
      ...jobOfferList
          .where((jobOffer) => favouriteList.contains(jobOffer.id))
          .map(Opportunity.fromJobOffer),
      ...freelanceList
          .where((freelance) => favouriteList.contains(freelance.id))
          .map(Opportunity.fromFreelance)
    ];
  }

  @override
  List<Object> get props => [jobOfferList, freelanceList, favouriteList];
}
