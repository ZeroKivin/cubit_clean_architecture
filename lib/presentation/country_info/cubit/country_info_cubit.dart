import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_info_state.dart';

class CountryInfoCubit extends Cubit<CountryInfoState> {
  CountryInfoCubit() : super(const CountryInfoInitial());
}
