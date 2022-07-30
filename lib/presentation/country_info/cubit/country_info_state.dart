part of 'country_info_cubit.dart';

abstract class CountryInfoState extends Equatable {
  const CountryInfoState();
}

class CountryInfoInitial extends CountryInfoState {
  const CountryInfoInitial();

  @override
  List<Object> get props => [];
}
