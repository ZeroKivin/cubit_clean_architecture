import 'package:cubit_clean_architecture/feature/country_list/domain/use_case/country_case.dart';
import 'package:cubit_clean_architecture/internal/app.dart';
import 'package:cubit_clean_architecture/internal/injector.dart';
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
  late final Injector _injector;
  late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;
  late final CountryCase _countryUseCase;

  @override
  void initState() {
    super.initState();

    _injector = Injector();
    _injector.setUpProductionMode();

    _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

    _countryUseCase = _injector.container.resolve<CountryCase>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CountryCase>(
          create: (_) => _countryUseCase,
        ),
        Provider<GlobalKey<ScaffoldMessengerState>>(
          create: (_) => _scaffoldMessengerKey,
        ),
      ],
      child: widget.app,
    );
  }
}
