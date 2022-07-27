import 'package:logger/logger.dart';

mixin LoggerMixin {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 4,
      printTime: true,
    ),
  );

  void log(Object message) {
    logger.i(message);
  }
}
