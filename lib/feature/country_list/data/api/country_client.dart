import 'package:cubit_clean_architecture/feature/country_list/data/dto/country_data.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/endpoint/get_all_country_endpoint.dart';
import 'package:cubit_clean_architecture/utility/logger/logger_mixin.dart';
import 'package:dio/dio.dart';

class CountryClient with LoggerMixin {
  CountryClient({required this.httpClient});

  final Dio httpClient;

  Future<List<CountryData>> getAll() async {
    final endpoint = GetAllCountryEndpoint();
    final url = endpoint.createUrl();

    log('GET $url');
    final response = await httpClient.get(url);
    final data = List<Map<String, dynamic>>.from(response.data ?? []);

    return data.map(CountryData.fromJson).toList();
  }
}
