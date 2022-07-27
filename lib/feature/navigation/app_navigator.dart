import 'package:cubit_clean_architecture/feature/country_list/presentation/country_list_screen.dart';
import 'package:cubit_clean_architecture/feature/navigation/navigation_cubit.dart';
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
