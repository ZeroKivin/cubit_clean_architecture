import 'package:cubit_clean_architecture/domain/entity/country/country.dart';
import 'package:cubit_clean_architecture/domain/repository/country_repository.dart';
import 'package:cubit_clean_architecture/domain/use_case/use_case.dart';
import 'package:cubit_clean_architecture/utility/error/error_handler.dart';

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
