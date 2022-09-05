import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
          theme: AppTheme.dark,
          themeData: appThemeData[AppTheme.dark]!,
        )) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChanged) {
        emit(ThemeState(
          theme: event.theme,
          themeData: appThemeData[event.theme]!,
        ));
      }
    });
  }
}
