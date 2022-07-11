import 'package:clean_business_logic/clean_business_logic.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country.dart';

abstract class ICountryRepository extends IRepository {
  Future<Iterable<Country>> getAllCountries();
}
