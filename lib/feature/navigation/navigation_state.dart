part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState({
    this.route = NavigationRoute.countryList,
  });

  final NavigationRoute route;

  @override
  List<Object> get props => [route];

  NavigationState copyWith({NavigationRoute? route}) {
    return NavigationState(
      route: route ?? this.route,
    );
  }
}

enum NavigationRoute { countryList }
