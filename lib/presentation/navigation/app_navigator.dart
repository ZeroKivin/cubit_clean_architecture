import 'package:cubit_clean_architecture/presentation/country_list/country_list.dart';
import 'package:cubit_clean_architecture/presentation/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, NavigationState>(
      bloc: NavigationCubit(),
      listener: (context, state) {
        if (state.route == NavigationRoute.countryList) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CountryListScreen(),
            ),
          );
        }
      },
      child: child,
    );
  }
}
