import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';
import 'package:dio/dio.dart';

class CountryListClient {
  CountryListClient({required this.httpClient});

  final Dio httpClient;

  Future<List<CountryData>> getAllCountries() async {
    final endpoint = GetAllCountryEndpoint();
    final uri = endpoint.createUri();

    final response = await httpClient.getUri(uri);
    final data = List<Map<String, dynamic>>.from(response.data ?? []);

    return data.map(CountryData.fromJson).toList();
  }
}
