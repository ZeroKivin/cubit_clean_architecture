import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';

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
