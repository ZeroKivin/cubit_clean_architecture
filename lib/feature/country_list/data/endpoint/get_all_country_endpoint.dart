import 'package:cubit_clean_architecture/utility/url/endpoint.dart';
import 'package:cubit_clean_architecture/utility/url/remote_config.dart';
import 'package:cubit_clean_architecture/utility/url/url.dart';

class GetAllCountryEndpoint extends Endpoint {
  final String api = RemoteConfig.defaultApi;
  final String url = Url.allCountries;

  @override
  Uri createUri() {
    return Uri.https(api, url);
  }
}
