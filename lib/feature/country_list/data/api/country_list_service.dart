import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';
import 'package:cubit_clean_architecture/utility/types/types.dart';
import 'package:dio/dio.dart';

class CountryListService {
  CountryListService({required this.httpClient});

  final Dio httpClient;

  Future<List<CountryData>> getAllCountries() async {
    final endpoint = GetAllCountryEndpoint();
    final uri = endpoint.createUri();

    final response = await httpClient.getUri(uri);
    final data = List<Json>.from(response.data ?? []);

    return data.map(CountryData.fromJson).toList();
  }
}
