import 'package:cubit_clean_architecture/utility/types/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_flag_data.g.dart';

@JsonSerializable()
class CountryFlagData {
  CountryFlagData({
    required this.png,
    required this.svg,
  });

  final String png;
  final String svg;

  factory CountryFlagData.fromJson(Json json) =>
      _$CountryFlagDataFromJson(json);

  Json toJson() => _$CountryFlagDataToJson(this);
}
