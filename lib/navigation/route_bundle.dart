import 'package:cubit_clean_architecture/utility/types/types.dart';

class RouteBundle {
  RouteBundle({
    required this.route,
    required this.data,
  });

  final String route;
  final Json data;
}
