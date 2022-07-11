import 'package:clean_business_logic/clean_business_logic.dart';
import 'package:logger/logger.dart';

class DefaultErrorHandler extends ErrorHandler {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 4,
      printTime: true,
    ),
  );

  @override
  void handleError(Object error) {
    final errorText = error.toString().split('\n')[0];
    logger.e(errorText);
  }
}
