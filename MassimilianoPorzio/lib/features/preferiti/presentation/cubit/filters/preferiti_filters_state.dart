part of 'preferiti_filters_cubit.dart';

class PreferitiFiltersState extends Equatable {
  final String searchTerm;

  const PreferitiFiltersState({
    required this.searchTerm,
  });

  factory PreferitiFiltersState.initial() =>
      const PreferitiFiltersState(searchTerm: "");

  @override
  List<Object> get props => [searchTerm];

  @override
  bool? get stringify => true;

  PreferitiFiltersParams get paramsFromState {
    return PreferitiFiltersParams(searchTerm: searchTerm);
  }

  bool get isEmpty {
    if (searchTerm.isNotEmpty) {
      return false;
    }
    return true;
  }

  int get numberOfActiveFilters {
    int result = 0;

    if (searchTerm.isNotEmpty) result++;

    return result;
  }

  PreferitiFiltersState copyWith({
    String? searchTerm,
  }) {
    return PreferitiFiltersState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
