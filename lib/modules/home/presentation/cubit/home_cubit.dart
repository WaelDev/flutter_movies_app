import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/modules/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  StreamSubscription? _subscription;

  HomeCubit() : super(const HomeState());

  changeTabNavigationItem(int index) {
    emit(state.copyWith(selectedTabNavigation: index));
  }

  checkConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        emit(state.copyWith(
          internetState: InternetState.connected,
          message: 'Connected',
        ));
      } else {
        emit(state.copyWith(
          internetState: InternetState.notConnected,
          message: 'Not Connected',
        ));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
