part of 'freelance_job_offer_filter_sheet_bloc.dart';

@freezed
class FreelanceJobOfferFilterSheetEvent with _$FreelanceJobOfferFilterSheetEvent {
  const factory FreelanceJobOfferFilterSheetEvent.initialized(FreelanceJobOfferFilters initialFilters) = _Initialized;
  const factory FreelanceJobOfferFilterSheetEvent.optionsRequested() = _OptionsRequested;
  const factory FreelanceJobOfferFilterSheetEvent.ndaOptionToggled(String optionName) = _ContrattoOptionToggled;
  const factory FreelanceJobOfferFilterSheetEvent.tipoDiRelazioneOptionToggled(String optionName) = _TeamOptionToggled;
  const factory FreelanceJobOfferFilterSheetEvent.filtersCleared() = _FiltersCleared;
}
