import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/home_page/components/home_page.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_bloc.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_cubit_model.dart';
import 'package:pokedex_ultra/modules/login/components/sign-up-screen.dart';
import 'package:pokedex_ultra/utils/components/poke-dialog.dart';
import 'package:pokedex_ultra/utils/components/poke-text-field.dart';

class SignInScreen extends StatelessWidget {
  static final String ROUTE = "/sign-in";
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

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
                  hint: "E-mail",
                  controller: _controllerEmail,
                  title: "E-mail",
                  focusNode: new FocusNode(),
                  keyboardType: TextInputType.text,
                  onChange: (value) { }
              ),
              new PokeTextField(
                  hint: "Password",
                  controller: _controllerPassword,
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
                      style: _mainTheme.textTheme.subtitle1?.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.tertiary
                  )),
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: _validateUser(context, _controllerEmail.text, _controllerPassword.text),
                  child: Text("SIGN-IN", style: _mainTheme.textTheme.button),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _mainTheme.colorScheme.tertiary
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 16, left: 8),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(SignUpScreen.ROUTE),
                  child: Text("Dont have a account? SIGN-UP!",
                      style: _mainTheme.textTheme.subtitle1?.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.tertiary
                      )),
                ),
              ),
            ],
          ),
          new Column(
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: new Text("Privacy policy and use terms",
                    style: _mainTheme.textTheme.subtitle1?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

 void Function() _validateUser(BuildContext context, String? emailAddress, String? password) {
    return () {
      if (emailAddress == null || emailAddress.isEmpty) {
        _showDialog(context, "INVALID E-MAIL", "Please, verify the e-mail.");
        return;
      }

      if (password == null || password.isEmpty) {
        _showDialog(context, "INVALID PASSWORD", "Please, verify the password.");
        return;
      }
      _createUser(context, emailAddress, password);
    };
  }

  void _createUser(BuildContext context, String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );

      if (credential.user != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomePage.ROUTE, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showDialog(context, "USER NOT FOUND", "Please, verify the e-mail.");
      } else if (e.code == 'wrong-password') {
        _showDialog(context, "INVALID PASSWORD", "Please, verify the password.");
      }
    }
  }

  Future _showDialog(BuildContext context, String title, String message) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => PokeDialog(
          title: title,
          message: message,
        )
    );
  }
}
