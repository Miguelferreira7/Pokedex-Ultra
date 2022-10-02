import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_bloc.dart';
import 'package:pokedex_ultra/utils/themes.dart';
import 'modules/login/components/cadastro.dart';
import 'modules/login/components/login.dart';

void main() {
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(create: (context) => LoginCubit())
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Pokedéx Ultra',
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