import 'package:equatable/equatable.dart';

class Country extends Equatable {
  const Country({
    required this.flag,
    required this.name,
  });

  final String name;
  final String flag;

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
