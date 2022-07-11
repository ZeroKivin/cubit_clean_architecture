import 'package:cubit_clean_architecture/feature/country_list/data/api/country_client.dart';
import 'package:cubit_clean_architecture/feature/country_list/data/repository/country_repository.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/repository/country_repository.dart';
import 'package:cubit_clean_architecture/feature/country_list/domain/use_case/country_case.dart';
import 'package:cubit_clean_architecture/internal/app.dart';
import 'package:cubit_clean_architecture/utility/error/error_handler.dart';
import 'package:cubit_clean_architecture/utility/logger/logger.dart';
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
  late final DefaultLogger _logger;
  late final DefaultErrorHandler _errorHandler;
  late final CountryClient _countryClient;
  late final ICountryRepository _countryRepository;
  late final CountryCase _countryUseCase;
  late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  @override
  void initState() {
    super.initState();

    _scaffoldMessengerKey = GlobalKey();

    _logger = DefaultLogger();
    _errorHandler = DefaultErrorHandler();

    _countryClient = CountryClient(_logger);
    _countryRepository = CountryRepository(
      client: _countryClient,
      logger: _logger,
    );
    _countryUseCase = CountryCase(
      repository: _countryRepository,
      logger: _logger,
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
