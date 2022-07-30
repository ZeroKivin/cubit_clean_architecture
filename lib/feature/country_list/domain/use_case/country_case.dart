import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';
import 'package:cubit_clean_architecture/utility/error/error_handler_mixin.dart';

class CountryCase with ErrorHandlerMixin {
  CountryCase({
    required this.repository,
  });

  final ICountryRepository repository;

  Future<Iterable<Country>> getAllCountries() async {
    try {
      return await repository.getAllCountries();
    } catch (error) {
      handleError(error);
      rethrow;
    }
  }
}
