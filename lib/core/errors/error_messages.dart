import 'package:predictiva/core/core.dart';

class ErrorMessages {
  static String connectionLost =
      '''Looks like you've lost your connection. Check your Wi-Fi or mobile data and try again.''';
  static String server =
      '''We're having trouble fetching data right now. It might be temporary. Give it another shot in a bit!''';
  static String unknown =
      '''Something unexpected happened on our end. We're on it. Please try again later.''';

  static String connectionLostTitle = 'No Internet Connection';
  static String serverTitle = 'Server Unreachable';
  static String unknownTitle = 'Unexpected Error';

  static String getErrorTitleFromFailure(Failure failure) {
    if (failure is ServerFailure) {
      return serverTitle;
    } else if (failure is ConnectionFailure) {
      return connectionLostTitle;
    }
    return unknownTitle;
  }
}
