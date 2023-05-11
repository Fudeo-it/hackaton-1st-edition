import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/app/resources/app_consts.dart';
import 'package:job_app/features/aziende/domain/usecases/annunci_azienda_params.dart';
import 'package:job_app/features/preferiti/data/datasources/preferiti_datasource.dart';
import 'package:job_app/features/preferiti/data/datasources/preferiti_local_datasource.dart';

import '../../../../../app/resources/string_constants.dart';
import '../../../../../core/domain/entities/typedefs.dart';
import '../../../../../core/domain/errors/failures.dart';

import '../../../../../core/log/bloc_logger.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../data/repositories/aziende_repository_impl.dart';
import '../../../domain/entities/annuncio_azienda.dart';
import '../../../domain/repositories/aziende_repository.dart';
import '../../../domain/usecases/fetch_all_annunci.dart';
import '../../../domain/usecases/load_annunci.dart';
import '../../../domain/usecases/refresh_annunci.dart';
import '../filters/aziende_filter_cubit.dart';

part 'aziende_state.dart';

class AziendeCubit extends Cubit<AziendeState> with BlocLoggy {
  final FetchAnnunciAzienda fetchAnnunciUsecase;
  final LoadAnnunciAzienda loadAnnunciUsecase;
  final RefreshAnnunciAzienda refreshAnnunciUsecase;

  AziendeCubit({
    required this.loadAnnunciUsecase,
    required this.refreshAnnunciUsecase,
    required this.fetchAnnunciUsecase,
  }) : super(AziendeState.initial());

  togglePreferito(String id) {
    final newListaAnnunci = state.listaAnnunci.map((AnnuncioAzienda annuncio) {
      if (annuncio.id == id) {
        return annuncio.copyWith(preferito: !annuncio.preferito);
      }
      return annuncio;
    }).toList();
    emit(state.copyWith(
        status: AziendeStateStatus.loaded, listaAnnunci: newListaAnnunci));
  }

  reset() {
    sl<AziendeFilterCubit>().resetFiltri();
    // //recupero hasMore e nextCursor della lista NON filtrata
    // //e li metto al posto di hasMore e nextCursor
    // (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMore =
    //     (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMoreNoFilter;
    // (sl<AziendeRepository>() as AziendeRepositoryImpl).nextCursor =
    //     (sl<AziendeRepository>() as AziendeRepositoryImpl).nextCursorNoFilter;

    // if (state.listaAnnunciNoFilter.isNotEmpty) {
    //   emit(AziendeState(
    //       status: AziendeStateStatus.loaded,
    //       listaAnnunci: state.listaAnnunciNoFilter,
    //       listaAnnunciNoFilter: state.listaAnnunciNoFilter)); //TODO da rivedere
    // } else {
    emit(AziendeState.initial());
    (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMore = true;
    (sl<AziendeRepository>() as AziendeRepositoryImpl).nextCursor = "";
    loadAnnunci(AnnunciAzParams.empty());
  }

  recuperaAnnunci(AnnunciAzParams params, Type tipoDiCasoDuso) async {
    loggy.debug("I FILTRI SONO: $params");

    if (state.listaAnnunci.isEmpty) {
      emit(state.copyWith(status: AziendeStateStatus.initial));
    }
    final response = tipoDiCasoDuso == LoadAnnunciAzienda
        ? await loadAnnunciUsecase(params)
        : await refreshAnnunciUsecase(params);
    response.fold(
      (failure) {
        switch (failure.runtimeType) {
          case NetworkFailure:
            emit(state.copyWith(
                status: AziendeStateStatus.noConnection,
                message: StringConsts.connectivtyError));
            break;
          case ServerFailure:
            emit(state.copyWith(
              status: AziendeStateStatus.serverFailure,
              message: StringConsts.serverError,
            ));
            break;
          default:
            emit(state.copyWith(
                status: AziendeStateStatus.error,
                message: StringConsts.genericError));
        }
      },
      (r) {
        AnnuncioAziendaList listaAggiornata = [];
        loggy.debug(
            "hasMore is ${(sl<AziendeRepository>() as AziendeRepositoryImpl).hasMore}");

        // loggy.debug(r as List<Annuncio>);

        if (tipoDiCasoDuso == RefreshAnnunciAzienda) {
          //* qui ho sempre lista PIU' LUNGA!
          listaAggiornata = [...state.listaAnnunci, ...r];
        } else {
          //* qui ho sempre lista NUOVA! da prima pagina
          listaAggiornata = [...r];
        }

        // loggy.debug("lista aggiornata: $listaAggiornata");
        //TODO: da fare il check se preferito o no

        emit(state.copyWith(
          status: AziendeStateStatus.loaded,
          listaAnnunci: listaAggiornata,
        ));
      },
    );
  }

  refreshAnnunci(AnnunciAzParams params) async {
    if (params.isEmpty) {
      // (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMore =
      //     (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMoreNoFilter;
      // (sl<AziendeRepository>() as AziendeRepositoryImpl).nextCursor =
      //     (sl<AziendeRepository>() as AziendeRepositoryImpl).nextCursorNoFilter;
    }
    bool hasMore = (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMore;
    // if (!hasMore && state.listaAnnunci.isNotEmpty) {
    if (!hasMore) {
      return;
    }
    recuperaAnnunci(params, RefreshAnnunciAzienda);
  }

  recuperaListaNonFiltrata() async {
    if (state.listaAnnunciNoFilter.isNotEmpty) {
      (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMore =
          (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMoreNoFilter;
      (sl<AziendeRepository>() as AziendeRepositoryImpl).nextCursor =
          (sl<AziendeRepository>() as AziendeRepositoryImpl).nextCursorNoFilter;

      emit(AziendeState(
          status: AziendeStateStatus.loaded,
          listaAnnunci: state.listaAnnunciNoFilter,
          listaAnnunciNoFilter: const []));
    }
  }

  loadAnnunci(AnnunciAzParams params) async {
    emit(AziendeState(
        status: AziendeStateStatus.loading,
        listaAnnunci: const [],
        listaAnnunciNoFilter: params.isEmpty ? [] : state.listaAnnunci));
    recuperaAnnunci(params, LoadAnnunciAzienda);
  }

  fetchAnnunci(
      //TODO usare params
      {String searchTerm = "",
      bool juniorSeniorityFilter = false,
      bool midSeniorityFilter = false,
      bool seniorSeniorityFilter = false,
      bool fullTimeFilter = false,
      bool partTimeFilter = false,
      bool inSedeFilter = false,
      bool ibridoFilter = false,
      bool fullRemoteFilter = false,
      String? annuncioId}) async {
    loggy.info("IL TERMINE DI RICERCA è: $searchTerm");
    bool hasMore = (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMore;

    if (!hasMore && state.listaAnnunci.isNotEmpty) {
      return;
    } else {
      // emit(state.copyWith(status: AziendeStateStatus.loading));
      //costruiscio annunciAzParams
      AnnunciAzParams params = AnnunciAzParams(
        searchTerm: searchTerm,
        juniorSeniorityFilter: juniorSeniorityFilter,
        midSeniorityFilter: midSeniorityFilter,
        seniorSeniorityFilter: seniorSeniorityFilter,
        fullRemoteFilter: fullRemoteFilter,
        fullTimeFilter: fullTimeFilter,
        ibridoFilter: ibridoFilter,
        inSedeFilter: inSedeFilter,
        partTimeFilter: partTimeFilter,
      ).copyWith(annuncioId: annuncioId);
      if (state.listaAnnunci.isEmpty) {
        emit(state.copyWith(status: AziendeStateStatus.initial));
      }
      final response = await fetchAnnunciUsecase(params);
      response.fold(
        (failure) {
          switch (failure.runtimeType) {
            case NetworkFailure:
              emit(state.copyWith(
                  status: AziendeStateStatus.noConnection,
                  message: StringConsts.connectivtyError));
              break;
            case ServerFailure:
              emit(state.copyWith(
                status: AziendeStateStatus.serverFailure,
                message: StringConsts.serverError,
              ));
              break;
            default:
              emit(state.copyWith(
                  status: AziendeStateStatus.error,
                  message: StringConsts.genericError));
          }
        },
        (r) {
          loggy.debug(
              "hasMore is ${(sl<AziendeRepository>() as AziendeRepositoryImpl).hasMore}");

          // loggy.debug(r as List<Annuncio>);
          //TODO da concatenare solo se non è initial e refresh ?
          AnnuncioAziendaList listaAggiornata = [...state.listaAnnunci, ...r];
          // loggy.debug("lista aggiornata: $listaAggiornata");

          emit(state.copyWith(
            status: AziendeStateStatus.loaded,
            listaAnnunci: listaAggiornata,
          ));
        },
      );
    }

    // emit(state.copyWith(status: AziendeStateStatus.loaded, listaAnnunci: []));
    // emit(AziendeStateNoConnection());
    // emit(
    //     const AziendeStateError(message: StringConsts.serverError)); //per debug
    // emit(const AziendeStateError(
    //     message: StringConsts.genericError)); //per debug
  }
}
