import 'package:clean_business_logic/clean_business_logic.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/dto/country_data.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/endpoint/get_all_country.dart';
import 'package:dio/dio.dart';

class CountryClient extends Client {
  CountryClient({
    required this.httpClient,
  });

  final Dio httpClient;

  Future<List<CountryData>> getAll() async {
    final endpoint = GetAllCountryEndpoint();
    final url = createUrl<GetAllCountryEndpoint>(endpoint);

    log('GET $url');
    final response = await httpClient.get<List<dynamic>>(url);

    final data = response.data!;

    return data
        .map((dynamic i) => CountryData.fromJson(i as Map<String, dynamic>))
        .toList();
  }
}
