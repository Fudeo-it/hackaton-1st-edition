abstract class Failure {}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class ParsingFailure extends Failure {}

class CacheFailure extends Failure {}

class GenericFailure extends Failure {}

class NoAnnuncioFailure extends Failure {}

class EmptyListFailure extends Failure {}
