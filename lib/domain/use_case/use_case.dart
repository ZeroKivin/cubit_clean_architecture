import 'package:cubit_clean_architecture/utility/error/error_handler.dart';

abstract class UseCase {
  final ErrorHandler _errorHandler;

  UseCase(this._errorHandler);

  void handleError(Object error) {
    _errorHandler.handleError(error);
  }
}
