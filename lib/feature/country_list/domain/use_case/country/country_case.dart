import 'package:clean_business_logic/clean_business_logic.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country/country.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/repository/country_repository.dart';

class CountryCase extends UseCase {
  final ICountryRepository repository;

  CountryCase({
    required this.repository,
    required ErrorHandler errorHandler,
  }) : super(errorHandler);

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
