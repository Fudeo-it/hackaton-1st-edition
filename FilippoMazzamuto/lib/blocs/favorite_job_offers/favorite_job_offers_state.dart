part of 'favorite_job_offers_bloc.dart';

enum FavoriteJobOffersStatus { initial, loading, success, failure }

class FavoriteJobOffersState extends Equatable {
  final FavoriteJobOffersStatus status;
  final List<JobOffer> jobOfferFavorites;
  final String errorMessage;

  const FavoriteJobOffersState({
    this.status = FavoriteJobOffersStatus.initial,
    this.jobOfferFavorites = const [],
    this.errorMessage = '',
  });

  FavoriteJobOffersState copyWith({
    final FavoriteJobOffersStatus? status,
    final List<JobOffer>? jobOfferFavorites,
    final String? errorMessage,
  }) {
    return FavoriteJobOffersState(
      status: status ?? this.status,
      jobOfferFavorites: jobOfferFavorites ?? this.jobOfferFavorites,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
    status,
    jobOfferFavorites,
    errorMessage,
  ];
}