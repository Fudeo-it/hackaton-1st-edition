class RepositoryError extends Error {
  ///
  /// classe per identificare un errore nel repository
  ///
  final String errorMessage;

  RepositoryError([String? errorMessage])
      : errorMessage = errorMessage ?? 'Generic repository error';
}
