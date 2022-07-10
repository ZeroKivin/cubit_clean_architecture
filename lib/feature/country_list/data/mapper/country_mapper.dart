import 'package:cubit_clean_architecture/feature/country_list/data/dto/country_data.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country/country.dart';

Country mapCountry(CountryData data) {
  return Country(
    name: data.name.common,
    flag: data.flags.png.replaceFirst('/w320/', '/w640/'),
  );
}
