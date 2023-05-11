part of 'hiring_job_offer_filter_sheet_bloc.dart';

@freezed
class HiringJobOfferFilterSheetState with _$HiringJobOfferFilterSheetState {
  const factory HiringJobOfferFilterSheetState({
    @Default(HiringJobOfferFilterSheetStatus.initial)
    HiringJobOfferFilterSheetStatus status,
    dynamic error,

    List<SelectOption>? contrattoOptions,
    @Default([])
    List<String> contrattoSelectedOptions,

    List<SelectOption>? teamOptions,
    @Default([])
    List<String> teamSelectedOptions,

    List<SelectOption>? seniorityOptions,
    @Default([])
    List<String> senioritySelectedOptions,
  }) = _HiringJobOfferFilterSheetState;
}

enum HiringJobOfferFilterSheetStatus {
  initial,
  loading,
  success,
  error
}
