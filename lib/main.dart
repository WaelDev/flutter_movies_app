import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/services_locator.dart' as di;

void main() {
  // init Service locator
  di.setup();
  // observe Bloc
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
