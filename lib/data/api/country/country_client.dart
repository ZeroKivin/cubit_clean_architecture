import 'package:cubit_clean_architecture/data/api/client.dart';
import 'package:cubit_clean_architecture/data/dto/country_data.dart';
import 'package:cubit_clean_architecture/data/endpoint/get_all_country.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class CountryClient extends Client {
  CountryClient({
    required this.httpClient,
    required Logger logger,
  }) : super(logger: logger);

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
