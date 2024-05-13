abstract class Failure {
  const Failure({this.message});
  final String? message;
}

class ServerFailure extends Failure {
  ServerFailure({super.message});
}

class CacheFailure extends Failure {
  CacheFailure({super.message});
}

class ConnectionFailure extends Failure {
  ConnectionFailure({super.message});
}

class UnknownFailure extends Failure {
  UnknownFailure({super.message});
}
