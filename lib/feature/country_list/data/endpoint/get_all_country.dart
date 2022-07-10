import 'package:clean_business_logic/clean_business_logic.dart';
import 'package:cubit_clean_architecture/utility/url/remote_config.dart';
import 'package:cubit_clean_architecture/utility/url/url.dart';

class GetAllCountryEndpoint extends Endpoint {
  final String api = RemoteConfig.defaultApi;
  final String url = Url.allCountries;

  @override
  Uri create() {
    return Uri.https(api, url);
  }
}
