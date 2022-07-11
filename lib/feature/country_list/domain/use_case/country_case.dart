import 'package:clean_business_logic/clean_business_logic.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/repository/country_repository.dart';
import 'package:cubit_clean_architecture/utility/error/error_handler.dart';
import 'package:cubit_clean_architecture/utility/logger/logger.dart';

class CountryCase extends UseCase<ICountryRepository> {
  CountryCase({
    required DefaultLogger logger,
    required DefaultErrorHandler errorHandler,
    required ICountryRepository repository,
  }) : super(
          logger: logger,
          errorHandler: errorHandler,
          repository: repository,
        );

  Future<Iterable<Country>> getAllCountries() async {
    try {
      final result = await repository.getAllCountries();
      return result;
    } catch (error) {
      handleError(error);
      rethrow;
    }
  }
}
