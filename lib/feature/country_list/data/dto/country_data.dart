import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_data.g.dart';

@JsonSerializable()
class CountryData {
  CountryData({
    required this.name,
    required this.flags,
  });

  final CountryNameData name;
  final CountryFlagData flags;

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDataToJson(this);
}
