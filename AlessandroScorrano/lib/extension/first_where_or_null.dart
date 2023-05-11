extension IterableModifier<E> on Iterable<E> {
  /// estensione che cerca il primo elemento di tipo [E], e in caso non ci fosse ritorna null
  E? firstWhereOrNull(bool Function(E) test) =>
      cast<E?>().firstWhere((v) => v != null && test(v), orElse: () => null);
}
