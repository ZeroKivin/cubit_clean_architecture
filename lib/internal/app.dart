import 'package:cubit_clean_architecture/navigation/navigation.dart';
import 'package:cubit_clean_architecture/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldMessengerKey =
        context.read<GlobalKey<ScaffoldMessengerState>>();
    final navigation = context.read<Navigation>();

    return MaterialApp(
      title: 'Playstation Games',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigation.rootNavigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const CountryListScreen(),
    );
  }
}
