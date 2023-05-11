class RepositoryError extends Error {
  final String errorMessage;

  RepositoryError([String? errorMessage])
    : errorMessage = errorMessage ?? 'Generic Repository Error';
}