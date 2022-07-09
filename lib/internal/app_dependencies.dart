import 'package:cubit_clean_architecture/data/api/country/country_client.dart';
import 'package:cubit_clean_architecture/data/repository/country_repository.dart';
import 'package:cubit_clean_architecture/domain/repository/country_repository.dart';
import 'package:cubit_clean_architecture/domain/use_case/country/country_case.dart';
import 'package:cubit_clean_architecture/presentation/app.dart';
import 'package:cubit_clean_architecture/utility/error/error_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
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
  late final Logger _logger;
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
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 4,
        printTime: true,
      ),
    );
    _errorHandler = ErrorHandler(_logger);

    _countryClient = CountryClient(
      httpClient: _httpClient,
      logger: _logger,
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
