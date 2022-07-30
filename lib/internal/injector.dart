import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Injector {
  Injector() {
    container = KiwiContainer();
  }

  late final KiwiContainer container;

  void setUpProductionMode() {
    final dio = Dio();
    _addInterceptors(dio);

    container.registerInstance(dio);

    container.registerFactory(
      (container) => CountryListService(httpClient: container.resolve<Dio>()),
    );
    container.registerFactory(
          (container) =>
          CountryRepository(client: container.resolve<CountryListService>()),
    );
    container.registerFactory(
      (container) =>
          CountryCase(repository: container.resolve<CountryRepository>()),
    );
  }

  void _addInterceptors(Dio dio) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }
}
