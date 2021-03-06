class ServerException implements Exception {
  final int statusCode;
  final String statusMessage;
  final String comment;

  ServerException({
    this.statusCode,
    this.statusMessage,
    this.comment,
  });

  @override
  String toString() {
    return 'ServerException $statusCode $statusMessage $comment';
  }
}

class UserNotFoundException implements Exception {}

class CacheException implements Exception {}

class UserAlreadyExistsException implements Exception {}

class NoFavoritesException implements Exception {}
