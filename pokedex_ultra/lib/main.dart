import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_bloc.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit.dart';
import 'package:pokedex_ultra/modules/pokedex/pages/pokemon_details_page.dart';
import 'package:pokedex_ultra/utils/injection.dart';
import 'package:pokedex_ultra/utils/themes.dart';
import 'modules/home_page/bloc/home_page_cubit.dart';
import 'modules/home_page/pages/home_page.dart';
import 'firebase_options.dart';
import 'modules/login/pages/sign_in_screen.dart';
import 'modules/login/pages/sign_up_screen.dart';
import 'modules/login/pages/splash_screen.dart';
import 'modules/pokedex/pages/pokemons_list_page.dart';

void main() async {
  Injection.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<HomePageCubit>(create: (context) => HomePageCubit()),
        BlocProvider<PokedexCubit>(create: (context) => PokedexCubit()),
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
      initialRoute: HomePage.ROUTE,

      routes: {
        SplashScreen.ROUTE: (context) => const SplashScreen(),
        SignInScreen.ROUTE: (context) => SignInScreen(),
        SignUpScreen.ROUTE: (context) => SignUpScreen(),
        HomePage.ROUTE: (context) => HomePage(),
        PokemonListPage.ROUTE: (context) => PokemonListPage(),
        PokemonDetailsPage.ROUTE: (context) => PokemonDetailsPage()
      },
    );
  }
}
