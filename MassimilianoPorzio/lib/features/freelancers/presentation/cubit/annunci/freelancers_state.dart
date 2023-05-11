part of 'freelancers_cubit.dart';

enum FreelancersStateStatus {
  initial,
  loading,
  loaded,
  noConnection,
  serverFailure,
  error;
}

class FreelancersState extends Equatable with BlocLoggy {
  final FreelancersStateStatus status;
  final String? message;
  final AnnuncioFreelancerList listaAnnunci;
  final AnnuncioFreelancerList listaAnnunciNoFilter; //non filtrata

  const FreelancersState({
    required this.status,
    this.message,
    required this.listaAnnunci,
    required this.listaAnnunciNoFilter,
  });

  @override
  List<Object?> get props =>
      [status, message, listaAnnunci, listaAnnunciNoFilter];

  factory FreelancersState.initial() => const FreelancersState(
        status: FreelancersStateStatus.initial,
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

  FreelancersState copyWith({
    FreelancersStateStatus? status,
    String? message,
    AnnuncioFreelancerList? listaAnnunci,
    AnnuncioFreelancerList? listaAnnunciNoFilter,
  }) {
    return FreelancersState(
      status: status ?? this.status,
      message: message ?? this.message,
      listaAnnunci: listaAnnunci ?? this.listaAnnunci,
      listaAnnunciNoFilter: listaAnnunciNoFilter ?? this.listaAnnunciNoFilter,
    );
  }
}
