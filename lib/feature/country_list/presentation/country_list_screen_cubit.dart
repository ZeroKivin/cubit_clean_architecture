import 'package:cubit_clean_architecture/feature/country_list/domain/entity/country.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/use_case/country_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_list_screen_state.dart';

class CountryListScreenCubit extends Cubit<CountryListScreenState> {
  CountryListScreenCubit({
    required this.useCase,
    required this.scaffoldMessengerKey,
  }) : super(const CountryListScreenState());

  final CountryCase useCase;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  void init() {
    _loadCountryList();
  }

  void showErrorSnackBar(SnackBar snackBar) {
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  void refresh() {
    _loadCountryList();
  }

  Future<void> _loadCountryList() async {
    emit(state.copyWith(status: CountryListScreenStatus.loading));
    try {
      final countries = await useCase.getAllCountries();

      return emit(state.copyWith(
        status: CountryListScreenStatus.success,
        countries: countries,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: CountryListScreenStatus.error,
        errorText: 'При загрузке данных произошла ошибка',
      ));
    }
  }
}
