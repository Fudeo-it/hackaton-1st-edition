part of 'hiring_job_offer_detail_screen_bloc.dart';

@freezed
class HiringJobOfferDetailScreenState with _$HiringJobOfferDetailScreenState {
  const factory HiringJobOfferDetailScreenState({
    required HiringJobOffer hiringJobOffer,
    @Default(false)
    bool isFavorite
  }) = _HiringJobOfferDetailScreenState;
}
