import 'package:clean_business_logic/clean_business_logic.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/api/country/country_client.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/repository/country_repository.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/repository/country_repository.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/use_case/country/country_case.dart';
import 'package:cubit_clean_architecture/internal/app.dart';
import 'package:dio/dio.dart';
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
  late final ErrorHandler _errorHandler;
  late final Dio _httpClient;
  late final CountryClient _countryClient;
  late final ICountryRepository _countryRepository;
  late final CountryCase _countryUseCase;
  late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  @override
  void initState() {
    super.initState();

    _scaffoldMessengerKey = GlobalKey();

    _httpClient = Dio();
    _errorHandler = ErrorHandler();

    _countryClient = CountryClient(
      httpClient: _httpClient,
    );
    _countryRepository = CountryRepository(_countryClient);
    _countryUseCase = CountryCase(
      repository: _countryRepository,
      errorHandler: _errorHandler,
    );
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
        )
      ],
      child: widget.app,
    );
  }
}
