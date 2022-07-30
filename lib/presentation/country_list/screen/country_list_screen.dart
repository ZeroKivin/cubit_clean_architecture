import 'package:cubit_clean_architecture/feature/country_list/domain/domain.dart';
import 'package:cubit_clean_architecture/navigation/navigation.dart';
import 'package:cubit_clean_architecture/presentation/country_list/country_list.dart';
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
        navigation: context.read<Navigation>(),
      )..init(),
      child: const CountryListView(),
    );
  }
}
