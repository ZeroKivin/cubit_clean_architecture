import 'package:cubit_clean_architecture/internal/app.dart';
import 'package:cubit_clean_architecture/internal/app_dependencies.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    const AppDependencies(
      app: App(),
    ),
  );
}
