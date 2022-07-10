part of 'country_list_cubit.dart';

enum CountryListStatus { loading, success, error }

class CountryListState extends Equatable {
  const CountryListState({
    this.status = CountryListStatus.loading,
    this.countries = const <Country>[],
    this.errorText,
  });

  final CountryListStatus status;
  final Iterable<Country> countries;
  final String? errorText;

  CountryListState copyWith({
    CountryListStatus? status,
    Iterable<Country>? countries,
    String? errorText,
  }) {
    return CountryListState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      errorText: errorText,
    );
  }

  @override
  List<Object?> get props => [status, countries, errorText];
}
