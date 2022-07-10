import 'package:clean_business_logic/clean_business_logic.dart';

class Country extends Entity {
  const Country({
    required this.flag,
    required this.name,
  });

  final String name;
  final String flag;

  @override
  Country copyWith({
    String? name,
    String? flag,
  }) {
    return Country(
      name: name ?? this.name,
      flag: flag ?? this.flag,
    );
  }

  @override
  List<Object?> get props => [name, flag];
}
