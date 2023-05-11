part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final int selectedIndex;

  const NavigationState({required this.selectedIndex});

  factory NavigationState.initial() => const NavigationState(selectedIndex: 0);

  @override
  String toString() => 'NavigationState(selectedIndex: $selectedIndex)';

  @override
  List<Object> get props => [selectedIndex];

  NavigationState copyWith({
    int? selectedIndex,
  }) {
    return NavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
