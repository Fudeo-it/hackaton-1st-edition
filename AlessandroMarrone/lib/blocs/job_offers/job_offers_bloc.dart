import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/errors/repository_error.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

part 'job_offers_event.dart';
part 'job_offers_state.dart';

class JobOffersBloc extends Bloc<JobOffersEvent, JobOffersState> {
  final JobRepository jobRepository;

  JobOffersBloc({required this.jobRepository}) : super(JobOffersFetching()) {
    on<JobOffersFetchEvent>(_fetchJobs);
  }

  Future<void> _fetchJobs(JobOffersFetchEvent event, Emitter emit) async {
    emit(JobOffersFetching());

    try {
      final jobs = await jobRepository.jobsOffers(K.jobAnnouncementsDatabaseId);
      emit(jobs.isEmpty ? NoJobOffersFetched() : JobOffersFetched(jobs: jobs));
    } on RepositoryError catch (e) {
      emit(JobOffersError(errorMessage: e.errorMessage));
    } catch (e) {
      emit(const JobOffersError());
    }
  }

  void fetchJobs() => add(JobOffersFetchEvent());
}
