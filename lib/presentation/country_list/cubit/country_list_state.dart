part of 'country_list_cubit.dart';

abstract class CountryListState extends Equatable {
  const CountryListState();
}

class CountryListLoading extends CountryListState {
  const CountryListLoading();

  @override
  List<Object> get props => [];
}

class CountryListError extends CountryListState {
  const CountryListError({
    this.errorText = 'Неизвестная ошибка',
  });

  final String errorText;

  @override
  List<Object> get props => [errorText];
}

class CountryListSuccess extends CountryListState {
  const CountryListSuccess({
    required this.countries,
  });

  final Iterable<Country> countries;

  @override
  List<Object> get props => [countries];
}
