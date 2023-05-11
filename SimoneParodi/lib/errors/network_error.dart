class NetworkError extends Error {
  final int statusCode;
  final String? reasonPhrase;

  NetworkError({
    required this.statusCode,
    this.reasonPhrase,
  });
}
