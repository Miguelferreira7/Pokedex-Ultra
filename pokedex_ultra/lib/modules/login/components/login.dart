import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/home_page/components/home_page.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_bloc.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_cubit_model.dart';
import 'package:pokedex_ultra/modules/login/components/cadastro.dart';
import 'package:pokedex_ultra/utils/components/poke-text-field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static final String ROUTE = "/sign-in";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginCubitModel>(
      bloc: BlocProvider.of<LoginCubit>(context),
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 60,
            title: const Text("SIGN-IN"),
          ),
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {

    ThemeData _mainTheme = Theme.of(context);
    TextEditingController _controllerEmail = new TextEditingController();
    TextEditingController _controllerSenha = new TextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new PokeTextField(
                  theme: _mainTheme,
                  hint: "E-mail",
                  controller: _controllerEmail,
                  title: "E-mail",
                  focusNode: new FocusNode(),
                  keyboardType: TextInputType.text,
                  onChange: (value) { }
              ),
              new PokeTextField(
                  theme: _mainTheme,
                  hint: "Password",
                  controller: _controllerSenha,
                  title: "Password",
                  focusNode: new FocusNode(),
                  keyboardType: TextInputType.text,
                  onChange: (value) { }
              ),
              new Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 16, left: 8),
                child: GestureDetector(
                  child: Text("Forgot the password?",
                      style: _mainTheme.textTheme.subtitle1?.copyWith(fontSize: 18)),
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _mainTheme.colorScheme.secondary),
                  ),
                  child: Text("SIGN-IN", style: _mainTheme.textTheme.button),
                  onPressed: () {
                    _validateUser(context, _controllerEmail.text, _controllerSenha.text);
                  },
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 16, left: 8),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(SignUpScreen.ROUTE),
                  child: Text("Dont have a account? SIGN-UP!",
                      style: _mainTheme.textTheme.subtitle1?.copyWith(fontSize: 18)),
                ),
              ),
            ],
          ),
          new Column(
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: Image.asset("assets/logoBranco.png", scale: 5),
              ),
              new Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: new Text("Privacy policy and use terms",
                    style: _mainTheme.textTheme.subtitle1),
              )
            ],
          )
        ],
      ),
    );
  }

  void _validateUser(BuildContext context, String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );

      if (credential != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomePage.ROUTE, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
