import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);
  @override
  List<Object?> get props => [message];
  @override
  bool? get stringify => true;
}

class FetchDataException extends ServerException {
  const FetchDataException([message])
      : super("Errore nella comunicazione con il server");
}

class NetworkException implements Exception {}

class RestApiException implements Exception {}

class ParsingException implements Exception {}

class CacheException implements Exception {}

class NoAnnuncioException implements Exception {}

class EmptyListException implements Exception {}

class GenericException implements Exception {}
