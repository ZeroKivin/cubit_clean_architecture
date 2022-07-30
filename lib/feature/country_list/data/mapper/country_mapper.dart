import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';

Country mapCountry(CountryData data) {
  return Country(
    name: data.name.common,
    flag: data.flags.png.replaceFirst('/w320/', '/w640/'),
  );
}
