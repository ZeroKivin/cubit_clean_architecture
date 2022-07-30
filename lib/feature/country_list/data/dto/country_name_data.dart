import 'package:cubit_clean_architecture/utility/types/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_name_data.g.dart';

@JsonSerializable()
class CountryNameData {
  CountryNameData({
    required this.common,
    required this.official,
  });

  final String common;
  final String official;

  factory CountryNameData.fromJson(Json json) =>
      _$CountryNameDataFromJson(json);

  Json toJson() => _$CountryNameDataToJson(this);
}
