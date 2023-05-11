import 'package:equatable/equatable.dart';

class PreferitiFiltersParams extends Equatable {
  final String searchTerm;

  const PreferitiFiltersParams({
    this.searchTerm = "",
  });
  int get numberOfActiveFilters {
    int result = 0;

    if (searchTerm.isNotEmpty) result++;

    return result;
  }

  bool get isEmpty {
    if (searchTerm.isNotEmpty) {
      return false;
    }
    return true;
  }

  factory PreferitiFiltersParams.empty() => const PreferitiFiltersParams();

  @override
  List<Object> get props => [searchTerm];

  PreferitiFiltersParams copyWith({
    String? searchTerm,
  }) {
    return PreferitiFiltersParams(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
