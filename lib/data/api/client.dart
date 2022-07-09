import 'package:cubit_clean_architecture/utility/url/endpoint.dart';
import 'package:logger/logger.dart';

abstract class IClient {
  IClient({
    required this.logger,
  });

  Logger logger;

  String createUrl<T extends Endpoint>(T endpoint) {
    final uri = endpoint.create();
    final url = uri.toString();

    return url;
  }

  void log(Object message) {
    logger.i(message);
  }
}
