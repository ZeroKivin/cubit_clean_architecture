import 'package:cubit_clean_architecture/navigation/route_bundle.dart';
import 'package:cubit_clean_architecture/navigation/routes.dart';
import 'package:cubit_clean_architecture/presentation/presentation.dart';
import 'package:flutter/cupertino.dart';

export 'route_bundle.dart';
export 'routes.dart';

class Navigation {
  GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  Future<void> routeTo(RouteBundle bundle) async {
    switch (bundle.route) {
      case Routes.root:
        await rootNavigatorKey.currentState?.pushReplacement(
          CupertinoPageRoute(
            settings: RouteSettings(
              name: bundle.route,
              arguments: bundle.data,
            ),
            builder: (BuildContext context) => const CountryListScreen(),
          ),
        );
        break;
      case Routes.country:
        await rootNavigatorKey.currentState?.push(
          CupertinoPageRoute(
            settings: RouteSettings(
              name: bundle.route,
              arguments: bundle.data,
            ),
            builder: (BuildContext context) => const CountryInfoScreen(),
          ),
        );
        break;
      default:
        throw Exception('Route is not found');
    }
  }

  Future<bool?> back<T>({T? data}) async {
    return await rootNavigatorKey.currentState?.maybePop<T>(data);
  }
}
