import 'package:clean_business_logic/clean_business_logic.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/api/country/country_client.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/mapper/country_mapper.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country/country.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/repository/country_repository.dart';

class CountryRepository extends Repository implements ICountryRepository {
  CountryRepository(this._client);

  final CountryClient _client;

  @override
  Future<Iterable<Country>> getAllCountries() => _client.getAll().then(
        (value) => value.map(mapCountry),
      );
}
