import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: Colors.white.withOpacity(0.4),
          animationDuration: Duration(milliseconds: 700),
          splash: Image(
            image: AssetImage('assets/Pokeball.png'),
          ), nextScreen: LoadingPage(),

        ),
        //   Image(image: AssetImage('assets/Pokeball.png'),
      ),
    );
  }
}