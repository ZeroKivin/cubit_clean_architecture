import 'package:logger/logger.dart';

mixin ErrorHandlerMixin {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 4,
      printTime: true,
    ),
  );

  void handleError(Object error) {
    final errorText = error.toString().split('\n').first;
    logger.e(errorText);
  }
}
