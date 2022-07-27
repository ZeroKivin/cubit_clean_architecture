import 'package:cubit_clean_architecture/feature/country_list/presentation/country_list_screen.dart';
import 'package:cubit_clean_architecture/feature/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldMessengerKey =
        context.read<GlobalKey<ScaffoldMessengerState>>();

    return MaterialApp(
      title: 'Playstation Games',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const AppNavigator(
        child: CountryListScreen(),
      ),
    );
  }
}
