import 'package:cubit_clean_architecture/domain/entity/country/country.dart';
import 'package:cubit_clean_architecture/domain/use_case/country/country_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_list_state.dart';

class CountryListCubit extends Cubit<CountryListState> {
  CountryListCubit({
    required this.useCase,
    required this.scaffoldMessengerKey,
  }) : super(const CountryListState());

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
    emit(state.copyWith(status: CountryListStatus.loading));
    try {
      final countries = await useCase.getAllCountries();
      return emit(state.copyWith(
        status: CountryListStatus.success,
        countries: countries,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: CountryListStatus.error,
        errorText: 'При загрузке данных произошла ошибка',
      ));
    }
  }
}
