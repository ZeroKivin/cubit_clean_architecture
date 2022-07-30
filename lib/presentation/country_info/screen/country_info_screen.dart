import 'package:cubit_clean_architecture/presentation/country_info/country_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryInfoScreen extends StatelessWidget {
  const CountryInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CountryInfoCubit(),
      child: const CountryInfoView(),
    );
  }
}
