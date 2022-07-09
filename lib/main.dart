import 'package:cubit_clean_architecture/internal/app_dependencies.dart';
import 'package:cubit_clean_architecture/presentation/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const AppDependencies(
      app: App(),
    ),
  );
}
