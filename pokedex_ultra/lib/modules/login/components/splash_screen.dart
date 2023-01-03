import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/login/components/sign-in-screen.dart';
import '../../home_page/components/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static final String ROUTE = "/splash-screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _verifyAppState(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Center(
        child: const CircularProgressIndicator(color: Colors.yellow),
      ),
    );
  }

  void _verifyAppState(BuildContext context) async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              SignInScreen.ROUTE, (route) => false);
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              HomePage.ROUTE, (route) => false);
        }
      });
    } catch (e) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          SignInScreen.ROUTE, (route) => false);
    }
  }
}
