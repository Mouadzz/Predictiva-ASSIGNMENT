abstract class Failure {
  const Failure({required this.message});
  final String message;
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required super.message});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message});
}
