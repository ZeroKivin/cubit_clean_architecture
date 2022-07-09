import 'package:logger/logger.dart';

class ErrorHandler {
  final Logger _logger;

  ErrorHandler(this._logger);

  void handleError(Object error) {
    final errorText = error.toString().split('\n')[0];
    _logger.e(errorText);
  }
}
