import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_ultra/utils/components/poke-dialog.dart';
import 'package:pokedex_ultra/utils/components/poke-text-field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static final String ROUTE = "/sign-up";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        toolbarHeight: 60,
        title: const Text("SIGN-UP!"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    ThemeData _mainTheme = Theme.of(context);
    TextEditingController _controllerEmail = new TextEditingController();
    TextEditingController _controllerPassword = new TextEditingController();

    return new Container(
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
              new PokeTextField(
                  hint: "Confirm your Password",
                  controller: _controllerPassword,
                  title: "Confirm your Password",
                  focusNode: new FocusNode(),
                  keyboardType: TextInputType.text,
                  onChange: (value) { }
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _mainTheme.colorScheme.secondary
                    ),
                  ),
                  child: Text("SIGN-UP", style: _mainTheme.textTheme.button),
                  onPressed: () {
                    _createNewUser(context, _controllerEmail.text, _controllerPassword.text);
                  },
                ),
              )
            ],
          ),
          new Column(
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 16),
              ),
              new Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                    "Privacy policy and use terms",
                    style: _mainTheme.textTheme.subtitle1
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _createNewUser(BuildContext context, String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future _dialog (BuildContext context, String title, String message) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => PokeDialog(
            title: title,
            message: message
        )
    );
  }
}
