part of 'freelancers_filters_cubit.dart';

class FreelancersFiltersState extends Equatable {
  final String searchTerm;
  final bool siNdaFilter;
  final bool noNdaFilter;
  final bool soloRelazioneFilter;
  final bool altriRelazioneFilter;

  const FreelancersFiltersState({
    required this.searchTerm,
    required this.siNdaFilter,
    required this.noNdaFilter,
    required this.soloRelazioneFilter,
    required this.altriRelazioneFilter,
  });

  factory FreelancersFiltersState.initial() => const FreelancersFiltersState(
        searchTerm: "",
        siNdaFilter: false,
        noNdaFilter: false,
        soloRelazioneFilter: false,
        altriRelazioneFilter: false,
      );

  @override
  bool? get stringify => true;

  AnnunciFreelancersParams get paramsFromState {
    return AnnunciFreelancersParams(
        altriRelazioneFilter: altriRelazioneFilter,
        noNdaFilter: noNdaFilter,
        searchTerm: searchTerm,
        siNdaFilter: siNdaFilter,
        soloRelazioneFilter: soloRelazioneFilter);
  }

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

  @override
  List<Object> get props {
    return [
      searchTerm,
      siNdaFilter,
      noNdaFilter,
      soloRelazioneFilter,
      altriRelazioneFilter,
    ];
  }

  FreelancersFiltersState copyWith({
    String? searchTerm,
    bool? siNdaFilter,
    bool? noNdaFilter,
    bool? soloRelazioneFilter,
    bool? altriRelazioneFilter,
  }) {
    return FreelancersFiltersState(
      searchTerm: searchTerm ?? this.searchTerm,
      siNdaFilter: siNdaFilter ?? this.siNdaFilter,
      noNdaFilter: noNdaFilter ?? this.noNdaFilter,
      soloRelazioneFilter: soloRelazioneFilter ?? this.soloRelazioneFilter,
      altriRelazioneFilter: altriRelazioneFilter ?? this.altriRelazioneFilter,
    );
  }
}
