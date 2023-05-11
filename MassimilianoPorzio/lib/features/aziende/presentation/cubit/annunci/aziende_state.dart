part of 'aziende_cubit.dart';

enum AziendeStateStatus {
  initial,
  loading,

  loaded,
  noConnection,
  serverFailure,
  error;
}

class AziendeState extends Equatable with BlocLoggy {
  final AziendeStateStatus status;
  final String? message;
  final AnnuncioAziendaList listaAnnunci; //* CON I FILTRI!: è sempre filtrata
  final AnnuncioAziendaList listaAnnunciNoFilter;
  const AziendeState({
    required this.status,
    this.message,
    required this.listaAnnunci,
    required this.listaAnnunciNoFilter,
  });

  @override
  List<Object?> get props =>
      [status, message, listaAnnunci, listaAnnunciNoFilter];

  factory AziendeState.initial() => const AziendeState(
        status: AziendeStateStatus.initial,
        listaAnnunci: [],
        listaAnnunciNoFilter: [],
      );

  String get numeroAnnunciRecenti {
    if (listaAnnunci.isEmpty) {
      return "0";
    }
    int numAnnunciRecenti = 0;
    for (var annuncio in listaAnnunci) {
      var oggi = DateTime.now();
      var dataAnnuncio = annuncio.jobPosted;
      // loggy.debug("dataAnnuncio: $dataAnnuncio");
      int giorniDiDifferenza = oggi.difference(dataAnnuncio).inDays;
      if (giorniDiDifferenza < kNumeroGiorniPerRecenti) {
        numAnnunciRecenti += 1;
      }
    }
    return numAnnunciRecenti.toString();
  }

  String get numeroAziende {
    if (listaAnnunci.isEmpty) {
      return "0";
    }
    Set<String> setAziende = {};
    for (var annuncio in listaAnnunci) {
      setAziende.add(
          annuncio.nomeAzienda.content); //uso come elem il content del Weblink
    }
    return setAziende.length.toString();
  }

  AziendeState copyWith({
    AziendeStateStatus? status,
    String? message,
    AnnuncioAziendaList? listaAnnunci,
    AnnuncioAziendaList? listaAnnunciNoFilter,
  }) {
    return AziendeState(
        status: status ?? this.status,
        message: message ?? this.message,
        listaAnnunci: listaAnnunci ?? this.listaAnnunci,
        listaAnnunciNoFilter:
            listaAnnunciNoFilter ?? this.listaAnnunciNoFilter);
  }
}

// class AziendeStateInitial extends AziendeState {
//   const AziendeStateInitial({super.listaAnnunci = const []});
// }

// class AziendeStateLoading extends AziendeState {
//   const AziendeStateLoading({required super.listaAnnunci});
// }

// class AziendeStateNoConnection extends AziendeState {
//   const AziendeStateNoConnection({required super.listaAnnunci});
// }

// class AziendeStateLoaded extends AziendeState with UiLoggy {
//   const AziendeStateLoaded({required super.listaAnnunci});
// }

// class AziendeStateError extends AziendeState {
//   final String message;
//   const AziendeStateError({required this.message, required super.listaAnnunci});
// }
