part of 'preferiti_cubit.dart';

enum PreferitiStatus {
  loading,
  loaded,
  error;

  String toJson() => name;
  static PreferitiStatus fromJson(String json) => values.byName(json);
}

class PreferitiState extends Equatable {
  final ListaPreferiti listaPreferiti;
  final String? message;
  final PreferitiStatus status;

  factory PreferitiState.initial() {
    return const PreferitiState(
      listaPreferiti: [],
      status: PreferitiStatus.loading,
    );
  }

  const PreferitiState({
    required this.listaPreferiti,
    this.message,
    required this.status,
  });

  @override
  List<Object?> get props => [
        listaPreferiti,
        message,
        status,
      ];

  PreferitiState copyWith({
    ListaPreferiti? listaPreferiti,
    String? message,
    PreferitiStatus? status,
  }) {
    return PreferitiState(
      listaPreferiti: listaPreferiti ?? this.listaPreferiti,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  String get numeroAnnunciRecenti {
    if (listaPreferiti.isEmpty) {
      return "0";
    }
    int numAnnunciRecenti = 0;
    for (var annuncio in listaPreferiti) {
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
}
