import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/errors/repository_error.dart';
import 'package:offertelavoroflutter/models/job_offer_entries.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:offertelavoroflutter/repositories/notion/databases_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'job_offers_state.dart';
part 'job_offers_event.dart';

const throttleDuration = Duration(milliseconds: 1000);

// TODO capire come rimpiazzare il flags loadingScrollPage con il Transformer
/*
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}
*/


class JobOffersBloc extends Bloc<JobOffersEvent, JobOffersState> {
  final DatabasesRepository databasesRepository;

  bool loadingScrollPage = false;

  JobOffersBloc({required this.databasesRepository}) : super(const JobOffersState()) {
    on<JobOffersSubscriptionRequested>(
      _onSubscriptionRequested, 
      transformer: restartable(), //throttleDroppable(throttleDuration),
    );
    on<RefreshRequested>(_onRefresh);
    on<JobOffersSortFilterChanged>(_onSortFilterChanged);
    on<JobOffersClearAllFilters>(_onClearAllFilters);
    on<JobOffersFilterDeleted>(_onSortFilterDeleted);
    on<JobOffersFilterChanged>(_onFilterChanged);
  }

  FutureOr<void> _onSubscriptionRequested(
    JobOffersSubscriptionRequested event,
    Emitter<JobOffersState> emit,
  ) async {
    try {
      if (state.status == JobOffersStatus.initial) {
        emit(state.copyWith(status: JobOffersStatus.loading)); // loading
        final response = await databasesRepository.getJobOffers(
          offerType: event.nameRequest,
          params: state.entries.toJson(true)
        );

        return emit(state.copyWith(
          status: JobOffersStatus.success,
          jobOffers: response.results,
          hasMore: response.hasMore,
          nextCursor: response.nextCursor,
        ));
      }
      if(!state.hasMore) return;

      loadingScrollPage = true; // start scroll page
      final response = await databasesRepository.getJobOffers(
        offerType: event.nameRequest,
        params: {'start_cursor': state.nextCursor, ...state.entries.toJson(true) }
      );

      emit(state.copyWith(
        status: JobOffersStatus.success,
        jobOffers: List.of(state.jobOffers)..addAll(response.results),
        hasMore: response.hasMore,
        nextCursor: response.nextCursor,
      ));
      
    } on RepositoryError catch (e) {
      emit(state.copyWith(
        status: JobOffersStatus.failure,
        errorMessage: e.errorMessage,
      ));
    } catch (e) {
      emit(state.copyWith(status: JobOffersStatus.failure));
    } finally {
      loadingScrollPage = false; // end scroll page
    }
  }

  void _onRefresh(
    RefreshRequested event,
    Emitter<JobOffersState> emit,
  ) {
    emit(state.copyWith(
      jobOffers: [],
      status: JobOffersStatus.initial
    ));
  }

  void fetchJobOffers(String nameRequest) => add(JobOffersSubscriptionRequested(
    nameRequest: nameRequest
  ));

  void _onSortFilterChanged(
    JobOffersSortFilterChanged event,
    Emitter<JobOffersState> emit
  ) {
    List<Sort> currentSorts = state.entries.sorts;
    Sort newSort = Sort(
      property: event.propertyFilter,
      direction: event.sortDirection,
    );
    int index = currentSorts.indexOf(newSort);
    if (index != -1) {
      currentSorts[index] = newSort;
    } else {
      currentSorts = List.from(currentSorts)..add(newSort);
    }

    emit(state.copyWith(
      entries: state.entries.copyWith(
        sorts: currentSorts
      ),
      jobOffers: [],
      status: JobOffersStatus.initial
    ));

    // Il fetch verrà eseguito nel BlocListener con stato == initial
  }

  void _onClearAllFilters(
    JobOffersClearAllFilters event,
    Emitter<JobOffersState> emit
  ) async {
    emit(state.copyWith(
      entries: const JobOfferEntries(),
      jobOffers: [],
      status: JobOffersStatus.initial
    ));

    // Il fetch verrà eseguito nel BlocListener con stato == initial
  }

  void _onSortFilterDeleted(
    JobOffersFilterDeleted event,
    Emitter<JobOffersState> emit
  ) {

    if (event.filter is Sort) {
      state.entries.sorts.remove(event.filter);
    } else if (event.filter is DatabaseEntries) {
      for(var filter in state.entries.filter!.filters) {
        (filter as CompoundFilter).filters.remove(event.filter);
      }
    }

    emit(state.copyWith(
      status: JobOffersStatus.initial,
      jobOffers: [],
    ));
    // Il fetch verrà eseguito nel BlocListener con stato == initial
  }

  void _onFilterChanged(
    JobOffersFilterChanged event,
    Emitter<JobOffersState> emit,
  ) {
    var propertyName = event.field;
    var filterConditions = CompoundFilter.or(
      filters: event.values.map((value) => {
        DatabaseEntries.select(
          property: propertyName,
          value: SelectValue.equals(value: value)
        )
      })
      .expand((set) => set)
      .toList(growable: true)
    );

    var currentFilter = state.entries.filter;
    if (currentFilter == null) {
      // Se non è presente nessun filtro
      currentFilter = CompoundFilter.and(filters: [filterConditions]);
    } else {
      // Se è presente almeno un filtro controlliamo se esite
      // quel tipo di proprietà in caso lo aggiungiamo all'or altramenti
      // lo inseriamo nell'and
      var found = false;
      for (var or in currentFilter.filters) {
        (or as CompoundFilter).filters.removeWhere((filter) => 
        (filter as DatabaseEntries).property == propertyName);
        if (or.filters.isEmpty && event.values.isNotEmpty) {
          or.filters.addAll(filterConditions.filters);
          found = true;
          break;
        }
      }
      if (!found && event.values.isNotEmpty) {
        currentFilter.filters.add(filterConditions);
      }

      // clean the filter in the presence of empty lists
      currentFilter.filters.removeWhere((or) => (or as CompoundFilter).filters.isEmpty);
    }

    emit(state.copyWith(
      entries: state.entries.copyWith(
        filter: currentFilter,
      ),
      status: JobOffersStatus.initial,
      jobOffers: [],
    ));
    // Il fetch verrà eseguito nel BlocListener con stato == initial
  }
}