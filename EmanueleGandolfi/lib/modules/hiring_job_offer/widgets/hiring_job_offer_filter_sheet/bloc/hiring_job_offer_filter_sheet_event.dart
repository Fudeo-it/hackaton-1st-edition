part of 'hiring_job_offer_filter_sheet_bloc.dart';

@freezed
class HiringJobOfferFilterSheetEvent with _$HiringJobOfferFilterSheetEvent {
  const factory HiringJobOfferFilterSheetEvent.initialized(HiringJobOfferFilters initialFilters) = _Initialized;
  const factory HiringJobOfferFilterSheetEvent.optionsRequested() = _OptionsRequested;
  const factory HiringJobOfferFilterSheetEvent.contrattoOptionToggled(String optionName) = _ContrattoOptionToggled;
  const factory HiringJobOfferFilterSheetEvent.teamOptionToggled(String optionName) = _TeamOptionToggled;
  const factory HiringJobOfferFilterSheetEvent.seniorityOptionToggled(String optionName) = _SeniorityOptionToggled;
  const factory HiringJobOfferFilterSheetEvent.filtersCleared() = _FiltersCleared;
}
