part of 'aziende_filter_cubit.dart';

class AziendeFilterState extends Equatable {
  final String searchTerm;
  final bool juniorSeniorityFilter;
  final bool midSeniorityFilter;
  final bool seniorSeniorityFilter;

  final bool partTimeFilter;
  final bool fullTimeFilter;

  final bool inSedeFilter;
  final bool fullRemoteFilter;
  final bool ibridoFilter;

  const AziendeFilterState({
    required this.searchTerm,
    required this.juniorSeniorityFilter,
    required this.midSeniorityFilter,
    required this.seniorSeniorityFilter,
    required this.partTimeFilter,
    required this.fullTimeFilter,
    required this.inSedeFilter,
    required this.fullRemoteFilter,
    required this.ibridoFilter,
  });

  AnnunciAzParams get paramsFromState {
    return AnnunciAzParams(
      fullRemoteFilter: fullRemoteFilter,
      fullTimeFilter: fullTimeFilter,
      ibridoFilter: ibridoFilter,
      inSedeFilter: inSedeFilter,
      juniorSeniorityFilter: juniorSeniorityFilter,
      midSeniorityFilter: midSeniorityFilter,
      partTimeFilter: partTimeFilter,
      searchTerm: searchTerm,
      seniorSeniorityFilter: seniorSeniorityFilter,
    );
  }

  int get numberOfActiveFilters {
    int result = 0;
    if (juniorSeniorityFilter) result++;
    if (midSeniorityFilter) result++;
    if (seniorSeniorityFilter) result++;
    if (searchTerm.isNotEmpty) result++;
    if (partTimeFilter) result++;
    if (fullTimeFilter) result++;
    if (inSedeFilter) result++;
    if (fullRemoteFilter) result++;
    if (ibridoFilter) result++;
    return result;
  }

  bool get isSeniorityEmpty {
    if (juniorSeniorityFilter || midSeniorityFilter || seniorSeniorityFilter) {
      return false;
    }
    return true;
  }

  bool get isContrattoEmpty {
    if (partTimeFilter || fullTimeFilter) {
      return false;
    }
    return true;
  }

  bool get isTeamEmpty {
    if (inSedeFilter || ibridoFilter || fullRemoteFilter) {
      return false;
    }
    return true;
  }

  bool get isEmpty {
    if (!isSeniorityEmpty ||
        !isContrattoEmpty ||
        !isTeamEmpty ||
        searchTerm.isNotEmpty) {
      return false;
    }
    return true;
  }

  factory AziendeFilterState.initial() => const AziendeFilterState(
        searchTerm: "",
        juniorSeniorityFilter: false,
        midSeniorityFilter: false,
        seniorSeniorityFilter: false,
        fullRemoteFilter: false,
        fullTimeFilter: false,
        ibridoFilter: false,
        inSedeFilter: false,
        partTimeFilter: false,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object> get props {
    return [
      searchTerm,
      juniorSeniorityFilter,
      midSeniorityFilter,
      seniorSeniorityFilter,
      partTimeFilter,
      fullTimeFilter,
      inSedeFilter,
      fullRemoteFilter,
      ibridoFilter,
    ];
  }

  AziendeFilterState copyWith({
    String? searchTerm,
    bool? juniorSeniorityFilter,
    bool? midSeniorityFilter,
    bool? seniorSeniorityFilter,
    bool? partTimeFilter,
    bool? fullTimeFilter,
    bool? inSedeFilter,
    bool? fullRemoteFilter,
    bool? ibridoFilter,
  }) {
    return AziendeFilterState(
      searchTerm: searchTerm ?? this.searchTerm,
      juniorSeniorityFilter:
          juniorSeniorityFilter ?? this.juniorSeniorityFilter,
      midSeniorityFilter: midSeniorityFilter ?? this.midSeniorityFilter,
      seniorSeniorityFilter:
          seniorSeniorityFilter ?? this.seniorSeniorityFilter,
      partTimeFilter: partTimeFilter ?? this.partTimeFilter,
      fullTimeFilter: fullTimeFilter ?? this.fullTimeFilter,
      inSedeFilter: inSedeFilter ?? this.inSedeFilter,
      fullRemoteFilter: fullRemoteFilter ?? this.fullRemoteFilter,
      ibridoFilter: ibridoFilter ?? this.ibridoFilter,
    );
  }
}
