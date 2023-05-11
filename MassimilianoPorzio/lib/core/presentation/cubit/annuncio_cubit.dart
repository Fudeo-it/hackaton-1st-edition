import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_app/core/domain/usecases/fetch_annuncio.dart';

import '../../domain/entities/typedefs.dart';

part 'annuncio_state.dart';

class AnnuncioCubit extends Cubit<AnnuncioState> {
  final FetchAnnuncio fetchAnnuncioUsecase;

  AnnuncioCubit({required this.fetchAnnuncioUsecase})
      : super(AnnuncioState.initial());

  void fetchSingoloAnnuncio({required String annuncioId}) async {
    await fetchAnnuncioUsecase(AnnuncioParam(annuncioId: annuncioId));
  }
}
