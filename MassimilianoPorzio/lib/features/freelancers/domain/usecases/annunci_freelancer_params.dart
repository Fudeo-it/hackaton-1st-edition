import 'package:equatable/equatable.dart';

class AnnunciFreelancersParams extends Equatable {
  final String? annuncioId;
  //SERVE PER I FILTRI
  final String searchTerm;
  final bool siNdaFilter;
  final bool noNdaFilter;
  final bool soloRelazioneFilter;
  final bool altriRelazioneFilter;

  int get numberOfRelazioneFilters {
    int result = 0;
    if (soloRelazioneFilter) result++;
    if (altriRelazioneFilter) result++;

    return result;
  }

  int get numberOfNdaFilters {
    int result = 0;
    if (siNdaFilter) result++;
    if (noNdaFilter) result++;

    return result;
  }

  int get numberOfTypeOfFilter {
    int result = 0;
    if (!isNdaEmpty) result++;
    if (!isRelazioneEmpty) result++;
    if (searchTerm.isNotEmpty) result++;
    return result;
  }

  int get numberOfActiveFilters {
    int result = 0;
    if (siNdaFilter) result++;
    if (noNdaFilter) result++;
    if (soloRelazioneFilter) result++;
    if (searchTerm.isNotEmpty) result++;
    if (altriRelazioneFilter) result++;

    return result;
  }

  bool get isRelazioneEmpty {
    if (soloRelazioneFilter || altriRelazioneFilter) {
      return false;
    }
    return true;
  }

  bool get isNdaEmpty {
    if (siNdaFilter || noNdaFilter) {
      return false;
    }
    return true;
  }

  bool get isEmpty {
    if (searchTerm.isNotEmpty ||
        siNdaFilter ||
        noNdaFilter ||
        soloRelazioneFilter ||
        altriRelazioneFilter) {
      return false;
    }
    return true;
  }

  factory AnnunciFreelancersParams.empty() => const AnnunciFreelancersParams();

  const AnnunciFreelancersParams({
    this.annuncioId,
    this.searchTerm = "",
    this.siNdaFilter = false,
    this.noNdaFilter = false,
    this.soloRelazioneFilter = false,
    this.altriRelazioneFilter = false,
  });

  @override
  List<Object?> get props {
    return [
      annuncioId,
      searchTerm,
      siNdaFilter,
      noNdaFilter,
      soloRelazioneFilter,
      altriRelazioneFilter,
    ];
  }

  AnnunciFreelancersParams copyWith({
    String? annuncioId,
    String? searchTerm,
    bool? siNdaFilter,
    bool? noNdaFilter,
    bool? soloRelazioneFilter,
    bool? altriRelazioneFilter,
  }) {
    return AnnunciFreelancersParams(
      annuncioId: annuncioId ?? this.annuncioId,
      searchTerm: searchTerm ?? this.searchTerm,
      siNdaFilter: siNdaFilter ?? this.siNdaFilter,
      noNdaFilter: noNdaFilter ?? this.noNdaFilter,
      soloRelazioneFilter: soloRelazioneFilter ?? this.soloRelazioneFilter,
      altriRelazioneFilter: altriRelazioneFilter ?? this.altriRelazioneFilter,
    );
  }
}
