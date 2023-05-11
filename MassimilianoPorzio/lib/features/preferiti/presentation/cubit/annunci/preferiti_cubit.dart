import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/core/domain/usecases/base_usecase.dart';
import 'package:job_app/core/log/bloc_logger.dart';
import 'package:job_app/features/preferiti/data/datasources/preferiti_datasource.dart';

import 'package:job_app/features/preferiti/data/datasources/preferiti_local_datasource.dart';
import 'package:job_app/features/preferiti/domain/entities/preferito.dart';
import 'package:job_app/features/preferiti/domain/usecases/aggiorna_preferito.dart';
import 'package:job_app/features/preferiti/domain/usecases/aggiungi_preferito.dart';
import 'package:job_app/features/preferiti/domain/usecases/lista_preferiti.dart';
import 'package:job_app/features/preferiti/domain/usecases/preferiti_filter_params.dart';
import 'package:job_app/features/preferiti/domain/usecases/preferiti_params.dart';
import 'package:job_app/features/preferiti/domain/usecases/rimuovi_preferito.dart';

import '../../../../../app/resources/app_consts.dart';
import '../../../../../app/resources/string_constants.dart';
import '../../../../../core/services/service_locator.dart';
import '../filters/preferiti_filters_cubit.dart';

part 'preferiti_state.dart';

class PreferitiCubit extends HydratedCubit<PreferitiState> with BlocLoggy {
  final AggiornaPreferito aggiornaPreferitoUsecase;
  final AggiungiPreferito aggiungiPreferitoUsecase;
  final OttieniPreferiti ottieniPreferitiUsecase;
  final RimuoviPreferito rimuoviPreferitoUsecase;

  PreferitiCubit({
    required this.aggiornaPreferitoUsecase,
    required this.aggiungiPreferitoUsecase,
    required this.ottieniPreferitiUsecase,
    required this.rimuoviPreferitoUsecase,
  }) : super(PreferitiState.initial());

  @override
  PreferitiState? fromJson(Map<String, dynamic> json) {
    var listaPreferiti = json['listaPreferiti'];
    var preferiti = List<Preferito>.from(
        listaPreferiti.map((model) => Preferito.fromJson(model)));
    (sl<PreferitiDataSource>() as PreferitiLocalDatasource).listaPreferiti =
        preferiti;
    return PreferitiState(
        listaPreferiti: preferiti, status: PreferitiStatus.loaded);
  }

  @override
  Map<String, dynamic>? toJson(PreferitiState state) {
    final result = <String, dynamic>{};
    final listaPreferiti = [];
    for (var preferito in state.listaPreferiti) {
      listaPreferiti.add(preferito.toJson());
    }
    result.addAll({'listaPreferiti': listaPreferiti});

    return result;
  }

  reset() {
    emit(PreferitiState.initial());

    ottieniPreferiti(PreferitiFiltersParams.empty());
  }

  rimuoviPreferito(Preferito preferito) async {
    final response =
        await rimuoviPreferitoUsecase(PreferitiParams(preferito: preferito));
    //recupero la lista aggiornata dopo aver tolto il preferito e la emetto come nuove stato
    ottieniPreferiti(PreferitiFiltersParams.empty());
  }

  aggiungiPreferito(Preferito preferito) async {
    final response =
        await aggiungiPreferitoUsecase(PreferitiParams(preferito: preferito));
    response.fold(
        (failure) => emit(state.copyWith(
            status: PreferitiStatus.error,
            message: StringConsts.genericError)), (r) {
      //recupero la lista aggiornata dopo aver aggiunto il preferito
      ottieniPreferiti(PreferitiFiltersParams.empty());
    });
  }

  ottieniPreferiti(PreferitiFiltersParams params) async {
    final response = await ottieniPreferitiUsecase(params);
    loggy.debug("RESPONSE IS: $response ");
    response.fold(
      (failure) => emit(state.copyWith(
          status: PreferitiStatus.error, message: StringConsts.genericError)),
      (r) => emit(
          state.copyWith(status: PreferitiStatus.loaded, listaPreferiti: r)),
    );
  }
}
