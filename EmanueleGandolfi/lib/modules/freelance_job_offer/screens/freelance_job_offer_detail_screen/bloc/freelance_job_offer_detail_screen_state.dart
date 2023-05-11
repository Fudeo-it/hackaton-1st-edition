part of 'freelance_job_offer_detail_screen_bloc.dart';

@freezed
class FreelanceJobOfferDetailScreenState with _$FreelanceJobOfferDetailScreenState {
  const factory FreelanceJobOfferDetailScreenState({
    required FreelanceJobOffer freelanceJobOffer,
    @Default(false)
    bool isFavorite
  }) = _FreelanceJobOfferDetailScreenState;
}
