import 'package:cubit_clean_architecture/presentation/country_list/country_list.dart';
import 'package:cubit_clean_architecture/presentation/navigation/navigation.dart';
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
