import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';
import 'package:cubit_clean_architecture/navigation/navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_list_state.dart';

class CountryListCubit extends Cubit<CountryListState> {
  CountryListCubit({
    required this.useCase,
    required this.scaffoldMessengerKey,
    required this.navigation,
  }) : super(const CountryListLoading());

  final CountryCase useCase;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final Navigation navigation;

  void init() {
    _loadCountryList();
  }

  void openCard(Country country) {
    navigation.routeTo(RouteBundle(
      route: Routes.country,
      data: {
        'flag': country.flag,
        'name': country.name,
      },
    ));
  }

  void showErrorSnackBar(SnackBar snackBar) {
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  Future<void> _loadCountryList() async {
    emit(const CountryListLoading());
    try {
      final countries = await useCase.getAllCountries();

      return emit(CountryListSuccess(countries: countries));
    } catch (_) {
      emit(const CountryListError(
        errorText: 'При загрузке данных произошла ошибка',
      ));
    }
  }
}
