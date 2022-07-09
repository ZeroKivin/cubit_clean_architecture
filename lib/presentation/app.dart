import 'package:cubit_clean_architecture/presentation/screen/country_list_screen/country_list_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playstation Games',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CountryListScreen(),
    );
  }
}
