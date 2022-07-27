part of 'country_list_screen_cubit.dart';

class CountryListScreenState extends Equatable {
  const CountryListScreenState({
    this.status = CountryListScreenStatus.loading,
    this.countries = const <Country>[],
    this.errorText,
  });

  final CountryListScreenStatus status;
  final Iterable<Country> countries;
  final String? errorText;

  @override
  List<Object?> get props => [status, countries, errorText];

  CountryListScreenState copyWith({
    CountryListScreenStatus? status,
    Iterable<Country>? countries,
    String? errorText,
  }) {
    return CountryListScreenState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      errorText: errorText,
    );
  }
}

enum CountryListScreenStatus { loading, success, error }
