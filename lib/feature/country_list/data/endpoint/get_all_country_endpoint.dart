import 'package:cubit_clean_architecture/utility/network/network.dart';

class GetAllCountryEndpoint extends Endpoint {
  final String api = RemoteConfig.defaultApi;
  final String url = Url.allCountries;

  @override
  Uri createUri() {
    return Uri.https(api, url);
  }
}
