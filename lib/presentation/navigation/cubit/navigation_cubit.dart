import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void routeTo(NavigationRoute route) {
    emit(
      state.copyWith(
        route: route,
      ),
    );
  }
}
