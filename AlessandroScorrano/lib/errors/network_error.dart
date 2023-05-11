class NetworkError extends Error {
  ///
  /// classe per identificare l'errore di rete
  ///
  final int statusCode;
  final String? reasonPhrase;

  NetworkError(this.statusCode, this.reasonPhrase);
}
