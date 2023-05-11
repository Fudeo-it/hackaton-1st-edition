import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/models/models.dart';
import 'package:offertelavoroflutter/repositories/repositories.dart';
import 'package:offertelavoroflutter/services/storage.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc({
    required this.jobRepository,
    required this.storage,
  }) : super(const JobsState()) {
    on<JobsGet>(_onJobsGet);
    on<JobSave>(_onJobSave);
  }

  final JobRepository jobRepository;
  final Storage storage;

  FutureOr<void> _onJobsGet(
    JobsGet event,
    Emitter<JobsState> emit,
  ) async {
    emit(state.copyWith(status: JobsStatus.loading));
    try {
      List<Recruitment> recruitments = await jobRepository.getRecruitments();
      List<Freelance> freelances = await jobRepository.getFreelances();

      if (event.filters.query.isNotEmpty) {
        recruitments = recruitments
            .where((element) => element.name!.contains(event.filters.query))
            .toList();
        freelances = freelances
            .where((element) => element.code!.contains(event.filters.query))
            .toList();
      }

      if (event.filters.seniority == Seniority.junior) {
        recruitments = recruitments
            .where((element) => element.seniority!.toLowerCase() == 'junior')
            .toList();
        freelances = freelances
            .where((element) => element.relationType!.toLowerCase() == 'junior')
            .toList();
      }

      if (event.filters.seniority == Seniority.senior) {
        recruitments = recruitments
            .where((element) => element.seniority!.toLowerCase() == 'senior')
            .toList();
        freelances = freelances
            .where((element) => element.relationType!.toLowerCase() == 'senior')
            .toList();
      }

      if (event.filters.seniority == Seniority.mid) {
        recruitments = recruitments
            .where((element) => element.seniority!.toLowerCase() == 'mid')
            .toList();
        freelances = freelances
            .where((element) => element.relationType!.toLowerCase() == 'mid')
            .toList();
      }

      if (event.filters.team == Team.ibrid) {
        recruitments = recruitments
            .where((element) => element.team!.toLowerCase() == 'ibrido')
            .toList();
      }

      if (event.filters.team == Team.fullRemote) {
        recruitments = recruitments
            .where((element) => element.team!.toLowerCase() == 'full remote')
            .toList();
      }

      if (event.filters.team == Team.inOffice) {
        recruitments = recruitments
            .where((element) => element.team!.toLowerCase() == 'in sede')
            .toList();
      }

      if (event.filters.contract == Contract.fullTime) {
        recruitments = recruitments
            .where((element) => element.contract!.toLowerCase() == 'full time')
            .toList();
      }

      if (event.filters.contract == Contract.partTime) {
        recruitments = recruitments
            .where((element) => element.contract!.toLowerCase() == 'part time')
            .toList();
      }

      emit(state.copyWith(
        status: JobsStatus.success,
        recruitment: recruitments,
        freelance: freelances,
      ));
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      emit(state.copyWith(status: JobsStatus.failure));
    }
  }

  FutureOr<void> _onJobSave(
    JobSave event,
    Emitter<JobsState> emit,
  ) async {
    List<Recruitment> recruitments = List.from(state.recruitment);
    List<Freelance> freelances = List.from(state.freelance);

    try {
      final savedIds = await storage.getStringList('SAVED_IDS') ?? [];

      Recruitment recruitment = recruitments
          .firstWhere((element) => element.id == event.id, orElse: () {
        return const Recruitment();
      });
      Freelance freelance = freelances
          .firstWhere((element) => element.id == event.id, orElse: () {
        return const Freelance();
      });

      if (savedIds.contains(event.id)) {
        savedIds.remove(event.id);
        if (recruitment != const Recruitment()) {
          recruitment = recruitment.copyWith(isSaved: false);
        }

        if (freelance != const Freelance()) {
          freelance = freelance.copyWith(isSaved: false);
        }
        storage.setStringList('SAVED_IDS', savedIds);
      } else {
        savedIds.add(event.id);
        if (recruitment != const Recruitment()) {
          recruitment = recruitment.copyWith(isSaved: true);
        }

        if (freelance != const Freelance()) {
          freelance = freelance.copyWith(isSaved: true);
        }
        storage.setStringList('SAVED_IDS', savedIds);
      }

      if (recruitment != const Recruitment()) {
        recruitments[recruitments
            .indexWhere((element) => element.id == event.id)] = recruitment;
      }

      if (freelance != const Freelance()) {
        freelances[freelances.indexWhere((element) => element.id == event.id)] =
            freelance;
      }

      emit(state.copyWith(
        recruitment: recruitments,
        freelance: freelances,
      ));
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      emit(state.copyWith(status: JobsStatus.failure));
    }
  }
}
