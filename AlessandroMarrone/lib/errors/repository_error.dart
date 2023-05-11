class RepositoryError extends Error {
  final String errorMessage;
  final String? stack;

  RepositoryError([String? errorMessage, this.stack])
      : errorMessage = errorMessage ?? "Generic repository error";
}
