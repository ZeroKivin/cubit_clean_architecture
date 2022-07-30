import 'package:cubit_clean_architecture/feature/country_list/country_list.dart';
import 'package:cubit_clean_architecture/internal/app.dart';
import 'package:cubit_clean_architecture/internal/injector.dart';
import 'package:cubit_clean_architecture/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDependencies extends StatefulWidget {
  const AppDependencies({
    Key? key,
    required this.app,
  }) : super(key: key);

  final App app;

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  final Injector _injector = Injector();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final Navigation _navigation = Navigation();

  CountryCase get _countryUseCase => _injector.container.resolve<CountryCase>();

  @override
  void initState() {
    super.initState();

    _injector.setUpProductionMode();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalKey<ScaffoldMessengerState>>(
          create: (_) => _scaffoldMessengerKey,
        ),
        Provider<Navigation>(
          create: (_) => _navigation,
        ),
        Provider<CountryCase>(
          create: (_) => _countryUseCase,
        ),
      ],
      child: widget.app,
    );
  }
}
