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

  factory CountryNameData.fromJson(Map<String, dynamic> json) =>
      _$CountryNameDataFromJson(json);

  Map<String, dynamic> toJson() => _$CountryNameDataToJson(this);
}
