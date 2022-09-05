import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/modules/home/presentation/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 250,
      splash: Lottie.asset('assets/animations/netflix-logo.json'),
      nextScreen: HomeScreen(),
      backgroundColor: Colors.black,
    );
  }
}
