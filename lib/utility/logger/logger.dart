import 'package:clean_business_logic/scr/logger/logger.dart';
import 'package:logger/logger.dart';

class DefaultLogger extends AppLogger {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 4,
      printTime: true,
    ),
  );

  @override
  void log(Object message) {
    logger.i(message);
  }
}
