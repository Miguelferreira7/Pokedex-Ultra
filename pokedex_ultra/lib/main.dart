import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/home_page/components/home_page.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_bloc.dart';
import 'package:pokedex_ultra/modules/login/components/splash_screen.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit.dart';
import 'package:pokedex_ultra/utils/themes.dart';
import 'modules/home_page/bloc/home_page_cubit.dart';
import 'modules/login/components/sign_up_screen.dart';
import 'modules/login/components/sign_in_screen.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => HomePageCubit()),
          BlocProvider(create: (context) => PokedexCubit()),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Pokédex Ultra',
      debugShowCheckedModeBanner: false,
      theme: MainTheme.darkTheme,
      initialRoute: SplashScreen.ROUTE,
      routes: {
        SplashScreen.ROUTE: (context) => const SplashScreen(),
        SignInScreen.ROUTE: (context) => SignInScreen(),
        SignUpScreen.ROUTE: (context) => SignUpScreen(),
        HomePage.ROUTE: (context) => const HomePage(),
      },
    );
  }
}