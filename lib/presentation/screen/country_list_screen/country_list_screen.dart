import 'package:cubit_clean_architecture/domain/use_case/country/country_case.dart';
import 'package:cubit_clean_architecture/presentation/screen/country_list_screen/country_list_cubit.dart';
import 'package:cubit_clean_architecture/presentation/screen/country_list_screen/country_list_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryListCubit>(
      create: (context) => CountryListCubit(
        useCase: context.read<CountryCase>(),
        scaffoldMessengerKey: context.read<GlobalKey<ScaffoldMessengerState>>(),
      )..init(),
      child: const CountryListScreenView(),
    );
  }
}