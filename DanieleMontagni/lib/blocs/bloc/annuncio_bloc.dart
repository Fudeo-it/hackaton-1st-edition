import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:offerte_lavoro_flutter_app/mocks.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_model.dart';
import 'package:offerte_lavoro_flutter_app/repositories/annuncio_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'annuncio_event.dart';
part 'annuncio_state.dart';

class AnnuncioBloc extends Bloc<AnnuncioEvent, AnnuncioState> {
  final AnnuncioRepository annuncioRepository;
  List<AnnuncioModel> annunci = [];

  AnnuncioBloc({required this.annuncioRepository})
      : super(FetchingAnnuncioState()) {
    on<FetchAnnuncioEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(FetchingAnnuncioState());

      try {
        annunci = await AnnuncioRepository.annunci();

        //controllo se nelle sharedPreferences ci sono annunci memorizzati
        annunci.forEach((annuncio) {
          prefs.containsKey(annuncio.id)
              ? annuncio.inFavoritePage = true
              : null;
        });

        emit(annunci.isEmpty
            ? NoAnnuncioState()
            : FetchedAnnuncioState(annunci));
      } catch (e) {
        emit(ErrorAnnuncioState());
      }
    });

//-------------------------Toggle preferiti-------------------------------------------------------
    on<AnnuncioFavoriteEventToggle>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final annunci = (state as FetchedAnnuncioState).annunci;
      final annuncio = annunci.firstWhere(
          (element) => element.id == event.annuncioModel.id);
      annuncio.inFavoritePage = !annuncio.inFavoritePage;

//persistenza nuovo preferito o rimozione di uno già savato
      if (annuncio.inFavoritePage) {
        await prefs.setBool(annuncio.id, true);
      } else {
        await prefs.remove(annuncio.id);
      }

      emit(FetchedAnnuncioState(annunci));
    });

//---------------------------Reset Filtri----------------------------------------------------------------

    on<ResetFiltriAnnunciEvent>((event, emit) {
      final query = event.query;
      final filtriSelectedOnFalse = query.forEach((element) {
        element.selected = false;
      });
      emit(FetchedAnnuncioState(annunci));
    });

//---------------------------Filtri----------------------------------------------------------------
    on<AnnuncioQueryEvent>((event, emit) {
      final query = event.query;
      final List<String> seniority = [];
      final List<String> contratto = [];
      final List<String> team = [];

      List<AnnuncioModel> annunciFiltrati = [];

      final List<AnnuncioModel> annunciFiltratiSeniority = [];
      final List<AnnuncioModel> annunciFiltratiContratto = [];
      final List<AnnuncioModel> annunciFiltratiTeam = [];

      final liste = [
        annunciFiltratiSeniority,
        annunciFiltratiContratto,
        annunciFiltratiTeam
      ];

      List<AnnuncioModel> ann = [];

//cerco tutti i filtri selezionati
      final filtriTrue = query.where((element) {
        return element.selected == true;
      }).toList();

//controllo filtri per categoria
      filtriTrue.forEach((element) {
        if (element.categoria == "seniority") {
          annunciFiltrati = [];
          seniority.add(element.name);
          annunciFiltratiSeniority.addAll(annunci
              .where((annuncio) => (seniority.contains(annuncio.seniority)))
              .toList());
          annunciFiltrati.toSet().toList();
        }
        if (element.categoria == "contratto") {
          annunciFiltrati = [];
          contratto.add(element.name);
          annunciFiltratiContratto.addAll(annunci
              .where((annuncio) => (contratto.contains(annuncio.contratto)))
              .toList());
          annunciFiltrati.toSet().toList();
        }
        if (element.categoria == "team") {
          annunciFiltrati = [];
          team.add(element.name);
          annunciFiltratiTeam.addAll(annunci
              .where((annuncio) => (team.contains(annuncio.team)))
              .toList());
          annunciFiltrati.toSet().toList();
        }
      });

//intersezioine delle liste per filtrare annunci
      if (annunciFiltratiSeniority.isEmpty &&
          annunciFiltratiContratto.isEmpty &&
          annunciFiltratiTeam.isEmpty &&
          filtriTrue.isEmpty) {
        ann = annunci;
      } else if (annunciFiltratiSeniority.isEmpty &&
          annunciFiltratiContratto.isEmpty &&
          annunciFiltratiTeam.isEmpty) {
        ann = liste
            .fold<Set>(liste.first.toSet(), (a, b) => a.intersection(b.toSet()))
            .toList()
            .cast<AnnuncioModel>();
      } else if (annunciFiltratiSeniority.isNotEmpty &&
          annunciFiltratiContratto.isNotEmpty &&
          annunciFiltratiTeam.isNotEmpty) {
        ann = liste
            .fold<Set>(liste.first.toSet(), (a, b) => a.intersection(b.toSet()))
            .toList()
            .cast<AnnuncioModel>();
      } else if (annunciFiltratiSeniority.isNotEmpty &&
          annunciFiltratiTeam.isNotEmpty) {
        ann = annunciFiltratiSeniority
            .toSet()
            .where((element) => annunciFiltratiTeam.toSet().contains(element))
            .toList();
      } else if (annunciFiltratiSeniority.isNotEmpty &&
          annunciFiltratiContratto.isNotEmpty) {
        ann = annunciFiltratiSeniority
            .toSet()
            .where(
                (element) => annunciFiltratiContratto.toSet().contains(element))
            .toList();
      } else if (annunciFiltratiContratto.isEmpty &&
          annunciFiltratiTeam.isEmpty &&
          annunciFiltratiSeniority.isNotEmpty &&
          filtriTrue.length >= 2 &&
          seniority.length == 1) {
        ann = annunciFiltratiSeniority
            .toSet()
            .where(
                (element) => annunciFiltratiContratto.toSet().contains(element))
            .toList();
      } else if (annunciFiltratiContratto.isEmpty &&
          annunciFiltratiTeam.isEmpty &&
          annunciFiltratiSeniority.isNotEmpty &&
          contratto.length == 1 &&
          seniority.length >= 2) {
        ann = annunciFiltratiSeniority
            .toSet()
            .where(
                (element) => annunciFiltratiContratto.toSet().contains(element))
            .toList();
      } else if (annunciFiltratiContratto.isEmpty &&
          annunciFiltratiSeniority.isEmpty &&
          annunciFiltratiTeam.isNotEmpty &&
          filtriTrue.length >= 2) {
        ann = annunciFiltratiTeam
            .toSet()
            .where(
                (element) => annunciFiltratiContratto.toSet().contains(element))
            .toList();
      } else if (annunciFiltratiSeniority.isEmpty &&
          annunciFiltratiContratto.isEmpty &&
          annunciFiltratiTeam.isNotEmpty) {
        ann = annunciFiltratiTeam.toSet().toList();
      } else if (annunciFiltratiSeniority.isEmpty &&
          annunciFiltratiTeam.isEmpty &&
          annunciFiltratiContratto.isNotEmpty) {
        ann = annunciFiltratiContratto.toSet().toList();
      } else if (annunciFiltratiContratto.isEmpty &&
          annunciFiltratiTeam.isEmpty &&
          annunciFiltratiSeniority.isNotEmpty) {
        ann = annunciFiltratiSeniority.toSet().toList();
      } else {
        ann = annunciFiltratiContratto
            .toSet()
            .where((element) => annunciFiltratiTeam.toSet().contains(element))
            .toList();
      }

      emit(FetchedAnnuncioState(ann));
    });
  }

  void fetchAnnunci() => add(FetchAnnuncioEvent());
}
