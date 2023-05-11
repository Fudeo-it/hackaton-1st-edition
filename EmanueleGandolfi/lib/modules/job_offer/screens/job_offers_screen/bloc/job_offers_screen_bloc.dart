import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/job_offer/enums/job_offer_type.dart';

part 'job_offers_screen_event.dart';
part 'job_offers_screen_state.dart';
part 'job_offers_screen_bloc.freezed.dart';

class JobOffersScreenBloc extends Bloc<JobOffersScreenEvent, JobOffersScreenState> {
  JobOffersScreenBloc() : super(const JobOffersScreenState()) {
    on<JobOffersScreenEvent>((event, emit) {
      event.when(
        jobOfferTypeChanged: (type) => emit(state.copyWith(activeJobOfferType: type)),
      );
    });
  }
}
