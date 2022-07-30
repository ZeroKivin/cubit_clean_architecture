part of 'country_list_cubit.dart';

class CountryListState extends Equatable {
  const CountryListState({
    this.status = CountryListScreenStatus.loading,
    this.countries = const <Country>[],
    this.errorText,
  });

  final CountryListScreenStatus status;
  final Iterable<Country> countries;
  final String? errorText;

  @override
  List<Object?> get props => [status, countries, errorText];

  CountryListState copyWith({
    CountryListScreenStatus? status,
    Iterable<Country>? countries,
    String? errorText,
  }) {
    return CountryListState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      errorText: errorText,
    );
  }
}

enum CountryListScreenStatus { loading, success, error }
