import 'package:cubit_clean_architecture/domain/entity/country/country.dart';

abstract class ICountryRepository {
  Future<Iterable<Country>> getAllCountries();
}
