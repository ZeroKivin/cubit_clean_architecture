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

  factory CountryFlagData.fromJson(Map<String, dynamic> json) =>
      _$CountryFlagDataFromJson(json);

  Map<String, dynamic> toJson() => _$CountryFlagDataToJson(this);
}
