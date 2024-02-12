import 'package:gdsc_social/core/errors/failure.dart';

import 'cache_failure.dart';
import 'network_failure.dart';
import 'server_failure.dart';

class ErrorCategorizer {
  static Failure categorizeError(Exception error) {
    if (error.toString().contains('SocketException')) {
      return NetworkFailure('No internet connection');
    } else if (error.toString().contains('HttpException')) {
      return ServerFailure('Server error');
    } else {
      return CacheFailure('Cache error');
    }
  }
}
