import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_app/app/resources/app_consts.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/core/domain/errors/failures.dart';
import 'package:job_app/core/log/bloc_logger.dart';
import 'package:job_app/core/services/service_locator.dart';
import 'package:job_app/features/freelancers/domain/entities/annuncio_freelancer.dart';
import 'package:job_app/features/freelancers/domain/usecases/load_annunci_freelancer.dart';
import 'package:job_app/features/freelancers/domain/usecases/refresh_annunci_freelancer.dart';

import '../../../../../app/resources/string_constants.dart';
import '../../../data/repositories/freelancers_repo_impl.dart';
import '../../../domain/repositories/freelancers_repo.dart';
import '../../../domain/usecases/annunci_freelancer_params.dart';
import '../filters/freelancers_filters_cubit.dart';

part 'freelancers_state.dart';

class FreelancersCubit extends Cubit<FreelancersState> with BlocLoggy {
  final LoadAnnunciFreelancers loadAnnunciUsecase;
  final RefreshAnnunciFreelancer refreshAnnunciUsecase;

  FreelancersCubit({
    required this.loadAnnunciUsecase,
    required this.refreshAnnunciUsecase,
  }) : super(FreelancersState.initial());

  recuperaListaNonFiltrata() async {
    if (state.listaAnnunciNoFilter.isNotEmpty) {
      (sl<FreelancersRepository>() as FreelancersRepositoryImpl).hasMore =
          (sl<FreelancersRepository>() as FreelancersRepositoryImpl)
              .hasMoreNoFilter;
      (sl<FreelancersRepository>() as FreelancersRepositoryImpl).nextCursor =
          (sl<FreelancersRepository>() as FreelancersRepositoryImpl)
              .nextCursorNoFilter;

      emit(FreelancersState(
          status: FreelancersStateStatus.loaded,
          listaAnnunci: state.listaAnnunciNoFilter,
          listaAnnunciNoFilter: const []));
    }
  }

  togglePreferito(String id) {
    final newListaAnnunci =
        state.listaAnnunci.map((AnnuncioFreelancers annuncio) {
      if (annuncio.id == id) {
        return annuncio.copyWith(preferito: !annuncio.preferito);
      }
      return annuncio;
    }).toList();
    emit(state.copyWith(
        status: FreelancersStateStatus.loaded, listaAnnunci: newListaAnnunci));
  }

  reset() {
    sl<FreelancersFiltersCubit>().resetFiltri();
    emit(FreelancersState.initial());

    (sl<FreelancersRepository>() as FreelancersRepositoryImpl).hasMore = true;
    (sl<FreelancersRepository>() as FreelancersRepositoryImpl).nextCursor = "";
    loadAnnunci(AnnunciFreelancersParams.empty());
  }

  recuperaAnnunci(AnnunciFreelancersParams params, Type tipoDiCasoDuso) async {
    loggy.debug("I FILTRI SONO: $params");
    if (state.listaAnnunci.isEmpty) {
      emit(state.copyWith(status: FreelancersStateStatus.initial));
    }
    final response = tipoDiCasoDuso == LoadAnnunciFreelancers
        ? await loadAnnunciUsecase(params)
        : await refreshAnnunciUsecase(params);
    response.fold(
      (failure) {
        switch (failure.runtimeType) {
          case NetworkFailure:
            emit(state.copyWith(
                status: FreelancersStateStatus.noConnection,
                message: StringConsts.connectivtyError));
            break;
          case ServerFailure:
            emit(state.copyWith(
              status: FreelancersStateStatus.serverFailure,
              message: StringConsts.serverError,
            ));
            break;
          default:
            emit(state.copyWith(
                status: FreelancersStateStatus.error,
                message: StringConsts.genericError));
        }
      },
      (r) {
        AnnuncioFreelancerList listaAggiornata = [];
        loggy.debug(
            "hasMore is ${(sl<FreelancersRepository>() as FreelancersRepositoryImpl).hasMore}");

        // loggy.debug(r as List<Annuncio>);

        if (tipoDiCasoDuso == RefreshAnnunciFreelancer) {
          //* qui ho sempre lista PIU' LUNGA!
          listaAggiornata = [...state.listaAnnunci, ...r];
        } else {
          //* qui ho sempre lista NUOVA! da prima pagina
          listaAggiornata = [...r];
        }

        // loggy.debug("lista aggiornata: $listaAggiornata");

        emit(state.copyWith(
          status: FreelancersStateStatus.loaded,
          listaAnnunci: listaAggiornata,
        ));
      },
    );
  }

  refreshAnnunci(AnnunciFreelancersParams params) async {
    bool hasMore =
        (sl<FreelancersRepository>() as FreelancersRepositoryImpl).hasMore;
    // if (!hasMore && state.listaAnnunci.isNotEmpty) {
    if (!hasMore) {
      return;
    }
    recuperaAnnunci(params, RefreshAnnunciFreelancer);
  }

  loadAnnunci(AnnunciFreelancersParams params) async {
    emit(FreelancersState(
        status: FreelancersStateStatus.loading,
        listaAnnunci: const [],
        listaAnnunciNoFilter: params.isEmpty ? [] : state.listaAnnunci));
    recuperaAnnunci(params, LoadAnnunciFreelancers);
  }
}
