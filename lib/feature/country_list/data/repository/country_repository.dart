import 'package:clean_business_logic/clean_business_logic.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/api/country_client.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/mapper/country_mapper.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/repository/country_repository.dart';
import 'package:cubit_clean_architecture/utility/logger/logger.dart';

class CountryRepository extends Repository<CountryClient>
    implements ICountryRepository {
  CountryRepository({
    required CountryClient client,
    required DefaultLogger logger,
  }) : super(
          logger: logger,
          client: client,
        );

  @override
  Future<Iterable<Country>> getAllCountries() => client.getAll().then(
        (value) => value.map(mapCountry),
      );
}
