import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country.dart';

abstract class ICountryRepository {
  Future<Iterable<Country>> getAllCountries();
}
