import 'package:cubit_clean_architecture/feature/country_list/data/api/country_client.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/repository/country_repository.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/use_case/country_case.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

class Injector {
  Injector() {
    container = KiwiContainer();
  }

  late final KiwiContainer container;

  void setUpProductionMode() {
    container.registerInstance(Dio());

    container.registerFactory(
      (container) => CountryClient(httpClient: container.resolve<Dio>()),
    );
    container.registerFactory(
      (container) =>
          CountryRepository(client: container.resolve<CountryClient>()),
    );
    container.registerFactory(
      (container) =>
          CountryCase(repository: container.resolve<CountryRepository>()),
    );
  }
}
