import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/common/models/select_option/select_option.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer_filters/freelance_job_offer_filters.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer_options/freelance_job_offer_options.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/repositories/freelance_job_offer_repository.dart';

part 'freelance_job_offer_filter_sheet_event.dart';
part 'freelance_job_offer_filter_sheet_state.dart';
part 'freelance_job_offer_filter_sheet_bloc.freezed.dart';

class FreelanceJobOfferFilterSheetBloc extends Bloc<FreelanceJobOfferFilterSheetEvent, FreelanceJobOfferFilterSheetState> {
  final FreelanceJobOfferRepository _freelanceJobOfferRepository;

  FreelanceJobOfferFilterSheetBloc({
    required FreelanceJobOfferRepository freelanceJobOfferRepository
  }) : _freelanceJobOfferRepository = freelanceJobOfferRepository, super(const FreelanceJobOfferFilterSheetState()) {
    on<FreelanceJobOfferFilterSheetEvent>((event, emit) async {
      await event.when<Future>(
        initialized: (initialFilters) => _initialized(initialFilters, emit),
        optionsRequested: () => _optionsRequested(emit),
        ndaOptionToggled: (optionName) => _ndaOptionToggled(optionName, emit),
        tipoDiRelazioneOptionToggled: (optionName) => _tipoDiRelazioneOptionToggled(optionName, emit),
        filtersCleared: () => _filtersCleared(emit)
      );
    });
  }

  _initialized(FreelanceJobOfferFilters filters, Emitter<FreelanceJobOfferFilterSheetState> emit) async {
    emit(state.copyWith(
      ndaSelectedOptions: filters.nda,
      tipoDiRelazioneSelectedOptions: filters.tipoDiRelazione,
    ));
    await _optionsRequested(emit);
  }

  _optionsRequested(Emitter<FreelanceJobOfferFilterSheetState> emit) async {
    try {
      emit(state.copyWith(
        status: FreelanceJobOfferFilterSheetStatus.loading
      ));
      FreelanceJobOfferOptions freelanceJobOfferOptions = await _freelanceJobOfferRepository.getFreelanceJobOffersOptions();
      emit(state.copyWith(
        status: FreelanceJobOfferFilterSheetStatus.success,
        ndaOptions: freelanceJobOfferOptions.nda,
        tipoDiRelazioneOptions: freelanceJobOfferOptions.tipoDiRelazione,
      ));
    } catch(error) {
      emit(state.copyWith(
        status: FreelanceJobOfferFilterSheetStatus.error,
        error: error
      ));
    }
  }

  _ndaOptionToggled(String optionName, Emitter<FreelanceJobOfferFilterSheetState> emit) async {
    emit(state.copyWith(
      ndaSelectedOptions: _toggleItemInList(optionName, state.ndaSelectedOptions)
    ));
  }

  _tipoDiRelazioneOptionToggled(String optionName, Emitter<FreelanceJobOfferFilterSheetState> emit) async {
    emit(state.copyWith(
      tipoDiRelazioneSelectedOptions: _toggleItemInList(optionName, state.tipoDiRelazioneSelectedOptions)
    ));
  }

  _filtersCleared(Emitter<FreelanceJobOfferFilterSheetState> emit) async {
    emit(state.copyWith(
      ndaSelectedOptions: [],
      tipoDiRelazioneSelectedOptions: []
    ));
  }

  List<String> _toggleItemInList(String item, List<String> items) {
    List<String> copy = items.toList();
    if(copy.contains(item)) {
      return copy..remove(item);
    } else {
      return copy..add(item);
    }
  }
}
