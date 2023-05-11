import 'dart:async';
import 'package:annunci_lavoro_flutter/errors/repository_error.dart';
import 'package:annunci_lavoro_flutter/misc/job_ads_controller.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';
import 'package:annunci_lavoro_flutter/repositories/ads_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'job_ads_event.dart';
part 'job_ads_state.dart';

class JobAdsBloc extends Bloc<JobAdsEvent, JobAdsState> {
  ///
  /// [Bloc] che gestisce gli annunci di tipo [JobPosition].
  ///
  /// ha come dipendenze [adsRepository] per accedere al layer Repository e scaricare i dati dalle API.
  ///
  /// ed inizializza [freeLanceAdsController] come controller per gesrire la lista di  annunci [FreeLancePosition].
  ///
  final AdsRepository adsRepository;
  final JobAdsController jobAdsController = JobAdsController([]);

  JobAdsBloc({required this.adsRepository}) : super(JobAdsInitial()) {
    on<FetchInitialJobAdsEvent>(_fetchInitialData);
    on<FetchMoreJobAdsEvent>(_moreAds);
  }

  /// metodo che scarica i primi dati dalle API  ed inizializza il controller [JobAdsController] con i primi dati.
  FutureOr<void> _fetchInitialData(
      FetchInitialJobAdsEvent event, Emitter<JobAdsState> emit) async {
    emit(InitJobAdsState());
    try {
      final jobAds = await adsRepository.getjobPositions();
      addItems(jobAds);
      emit(FetchedJobAdsState());
    } on RepositoryError catch (error) {
      emit(ErrorJobAdsState(error.errorMessage));
    } catch (error) {
      emit(const ErrorJobAdsState());
    }
  }

  /// metodo che scarica altri annnci di tipo [JobPosition] e gli aggiunge al flusso dati  di [jobAdsController]
  FutureOr<void> _moreAds(
      FetchMoreJobAdsEvent event, Emitter<JobAdsState> emit) async {
    try {
      if (adsRepository.hasMoreJobAds == false) {
        emit(NoMoreJobAdsState());
        return;
      }
      emit(FetchingMoreJobAdsState());
      final jobAds = await adsRepository.getjobPositions();
      addItems(jobAds);
      emit(InitJobAdsState());
    } on RepositoryError catch (error) {
      emit(ErrorJobAdsState(error.errorMessage));
    } catch (error) {
      emit(const ErrorJobAdsState());
    }
  }

  /// metodo per aggiungere oggetti [JobPosition] al controller [jobAdsController]
  void addItems(List<JobPosition> items) {
    jobAdsController.addItems(items);
  }

  /// metodo che aggiunge l'evento [FetchInitialJobAdsEvent] al [Bloc].
  void fetchAds() => add(FetchInitialJobAdsEvent());

  /// metodo che aggiunge l'evento [FetchMoreJobAdsEvent] al [Bloc].
  void moreAds() => add(FetchMoreJobAdsEvent());
}
