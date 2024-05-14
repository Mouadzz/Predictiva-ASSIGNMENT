class ServerException implements Exception {}

class ParsingException implements Exception {
  ParsingException(this.message);

  final String message;
}

class CacheException implements Exception {}
