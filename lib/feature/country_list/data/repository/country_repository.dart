import 'package:cubit_clean_architecture/feature/country_list/data/api/country_list_client.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/mapper/country_mapper.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/repository/i_country_repository.dart';

class CountryRepository implements ICountryRepository {
  CountryRepository({
    required this.client,
  });

  final CountryListClient client;

  @override
  Future<Iterable<Country>> getAllCountries() => client.getAllCountries().then(
        (value) => value.map(mapCountry),
      );
}
