import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/global/theme/bloc/theme_bloc.dart';
import 'core/utils/string.dart';
import 'modules/home/presentation/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: AppString.appName,
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
