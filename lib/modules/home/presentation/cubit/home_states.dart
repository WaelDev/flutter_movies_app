import 'package:equatable/equatable.dart';

import 'package:movies_app/core/utils/enum.dart';

class HomeState extends Equatable {
  final int selectedTabNavigation;

  final InternetState internetState;
  final String message;

  const HomeState({
    this.selectedTabNavigation = 0,
    this.internetState = InternetState.notConnected,
    this.message = 'Not connected',
  });

  @override
  List<Object?> get props => [selectedTabNavigation, message, internetState];

  HomeState copyWith({
    int? selectedTabNavigation,
    InternetState? internetState,
    String? message,
  }) {
    return HomeState(
      selectedTabNavigation:
          selectedTabNavigation ?? this.selectedTabNavigation,
      internetState: internetState ?? this.internetState,
      message: message ?? this.message,
    );
  }
}
