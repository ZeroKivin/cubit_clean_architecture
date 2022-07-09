import 'package:cubit_clean_architecture/data/api/country/country_client.dart';
import 'package:cubit_clean_architecture/data/mapper/country_mapper.dart';
import 'package:cubit_clean_architecture/domain/entity/country/country.dart';
import 'package:cubit_clean_architecture/domain/repository/country_repository.dart';

class CountryRepository implements ICountryRepository {
  CountryRepository(this._client);

  final CountryClient _client;

  @override
  Future<Iterable<Country>> getAllCountries() => _client.getAll().then(
        (value) => value.map(mapCountry),
      );
}
