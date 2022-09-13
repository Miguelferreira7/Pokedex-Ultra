import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokedex_ultra/utils/themes.dart';
import 'package:bloc/bloc.dart';
import 'modules/login/components/cadastro.dart';
import 'modules/login/components/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Game Masters',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkTheme,
      initialRoute: SignInScreen.ROUTE,
      routes: {
        SignInScreen.ROUTE: (context) => new SignInScreen(),
        SignUpScreen.ROUTE: (context) => new SignUpScreen(),
      },
    );
  }
}