import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_ultra/modules/home_page/components/home_page.dart';
import 'package:pokedex_ultra/utils/components/poke-dialog.dart';
import 'package:pokedex_ultra/utils/components/poke-text-field.dart';

class SignUpScreen extends StatelessWidget {
  static final String ROUTE = "/sign-up";
  TextEditingController _controllerUsername = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

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
                  hint: "UserName",
                  controller: _controllerUsername,
                  title: "Insert your name",
                  focusNode: new FocusNode(),
                  keyboardType: TextInputType.text,
                  onChange: (value) { }
              ),
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
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _mainTheme.colorScheme.tertiary
                    ),
                  ),
                  child: Text("SIGN-UP", style: _mainTheme.textTheme.button),
                  onPressed: () {
                    _createNewUser(context);
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
                  style: _mainTheme.textTheme.subtitle1?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _createNewUser(BuildContext context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      await credential.user?.updateDisplayName(_controllerUsername.text);
      await _showDialog(context, "Success!", "Your account has been successfully created.");

      Navigator.of(context).pushNamedAndRemoveUntil(HomePage.ROUTE, (route) => false);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showDialog(context, "Weak Password", "The password provided is too weak.");

      } else if (e.code == 'email-already-in-use') {
        _showDialog(context, "E-mail Already In Use", "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
      _showDialog(context, "Error", "Try again");
    }
  }

  Future _showDialog (BuildContext context, String title, String message) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => PokeDialog(
          title: title,
          message: message,
        )
    );
  }
}
