import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';

abstract class ICountryRepository {
  Future<Iterable<Country>> getAllCountries();
}
