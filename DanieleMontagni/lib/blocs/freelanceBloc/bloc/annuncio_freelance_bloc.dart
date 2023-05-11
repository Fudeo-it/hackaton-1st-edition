import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';
import 'package:offerte_lavoro_flutter_app/repositories/annuncio_freelance_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'annuncio_freelance_event.dart';
part 'annuncio_freelance_state.dart';

class AnnuncioFreelanceBloc
    extends Bloc<AnnuncioFreelanceEvent, AnnuncioFreelanceState> {
  final AnnuncioFreelanceRepository annuncioFreelanceRepository;

  AnnuncioFreelanceBloc({required this.annuncioFreelanceRepository})
      : super(FetchingAnnuncioFreelanceState()) {
    on<FetchAnnuncioFreelanceEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(FetchingAnnuncioFreelanceState());

      try {
        final annunciFreelance =
            await AnnuncioFreelanceRepository.annunciFreelance();

//controllo se nelle sharedPreferences ci sono annunci memorizzati
        annunciFreelance.forEach((annuncio) {
          prefs.containsKey(annuncio.id)
              ? annuncio.inFavoritePage = true
              : null;
        });

        emit(annunciFreelance.isEmpty
            ? NoAnnuncioFreelanceState()
            : FetchedAnnuncioFreelanceState(annunciFreelance));
      } catch (e) {
        emit(ErrorAnnuncioFreelanceState());
      }
    });

//-------------------------Toggle preferiti-------------------------------------------------------
    on<AnnuncioFreelanceFavoriteEventToggle>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final annunciFreelance = (state as FetchedAnnuncioFreelanceState).annunci;
      final annuncio = annunciFreelance.firstWhere(
          (element) => element.id == event.annuncioFreelanceModel.id);
      annuncio.inFavoritePage = !annuncio.inFavoritePage;

//persistenza nuovo preferito o rimozione di uno già savato
      if (annuncio.inFavoritePage) {
        await prefs.setBool(annuncio.id, true);
      } else {
        await prefs.remove(annuncio.id);
      }

      emit(FetchedAnnuncioFreelanceState(annunciFreelance));
    });
  }
  void fetchAnnunciFreelance() => add(FetchAnnuncioFreelanceEvent());
}
