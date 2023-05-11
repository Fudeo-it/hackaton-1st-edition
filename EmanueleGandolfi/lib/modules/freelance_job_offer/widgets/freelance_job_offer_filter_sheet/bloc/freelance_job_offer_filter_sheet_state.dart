part of 'freelance_job_offer_filter_sheet_bloc.dart';

@freezed
class FreelanceJobOfferFilterSheetState with _$FreelanceJobOfferFilterSheetState {
  const factory FreelanceJobOfferFilterSheetState({
    @Default(FreelanceJobOfferFilterSheetStatus.initial)
    FreelanceJobOfferFilterSheetStatus status,
    dynamic error,

    List<SelectOption>? ndaOptions,
    @Default([])
    List<String> ndaSelectedOptions,

    List<SelectOption>? tipoDiRelazioneOptions,
    @Default([])
    List<String> tipoDiRelazioneSelectedOptions,
  }) = _FreelanceJobOfferFilterSheetState;
}

enum FreelanceJobOfferFilterSheetStatus {
  initial,
  loading,
  success,
  error
}
