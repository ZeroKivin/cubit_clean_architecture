import 'package:cubit_clean_architecture/feature/country_list/data/api/country_list_client.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/repository/country_repository.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/use_case/country_case.dart';
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
      (container) => CountryListClient(httpClient: container.resolve<Dio>()),
    );
    container.registerFactory(
      (container) =>
          CountryRepository(client: container.resolve<CountryListClient>()),
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
