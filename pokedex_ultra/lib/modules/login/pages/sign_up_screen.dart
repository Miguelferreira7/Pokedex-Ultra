import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_ultra/utils/components/poke-dialog.dart';
import 'package:pokedex_ultra/utils/components/poke-text-field.dart';
import 'package:pokedex_ultra/utils/firebase_exception_utils.dart';

import '../../home_page/pages/home_page.dart';

class SignUpScreen extends StatelessWidget {
  static final String ROUTE = "/sign-up";
  TextEditingController _controllerUsername = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text("SIGN-UP!"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    ThemeData _mainTheme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PokeTextField(
                  isPassword: false,
                  hint: "Username",
                  controller: _controllerUsername,
                  title: "Username",
                  focusNode: new FocusNode(),
                  keyboardType: TextInputType.text,
                ),
                PokeTextField(
                  isPassword: false,
                  hint: "E-mail",
                  controller: _controllerEmail,
                  title: "E-mail",
                  focusNode: new FocusNode(),
                  keyboardType: TextInputType.text,
                ),
                PokeTextField(
                  isPassword: true,
                  hint: "Password",
                  controller: _controllerPassword,
                  title: "Password",
                  focusNode: new FocusNode(),
                  keyboardType: TextInputType.text,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 4, top: 8),
                  child: Column(
                    children: [
                      Container (
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text("Password must have at least 8 characters and 3 of the following:"),
                      ),
                      _buildPasswordRequirement(context,"Have at least 6 characters"),
                      _buildPasswordRequirement(context, "1 uppercase letter"),
                      _buildPasswordRequirement(context, "1 lowercase letter"),
                    ],
                  ),
                ),
                Container(
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
                    onPressed: _validateUser(context),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Privacy policy and terms of use",
                    style: _mainTheme.textTheme.subtitle1?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary
                    )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordRequirement(BuildContext context, String requirement) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.fiber_manual_record,
            color: Theme.of(context).colorScheme.tertiary,
            size: 8
        ),
        Flexible(
          child: new AutoSizeText("  $requirement",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.subtitle1,
              minFontSize: 8,
              maxFontSize: 16,
              maxLines: 13),
        ),
      ],
    );
  }

  void Function() _validateUser(BuildContext context) {
    return () {
      if (_controllerUsername.text.isEmpty || _controllerEmail.text.isEmpty || _controllerPassword.text.isEmpty) {
        _showDialog(context,
            "WARNING", "Please, to create an new account, all camps need to be filled in.");
        return;
      }
      _createNewUser(context);
    };
  }

  void _createNewUser(BuildContext context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text
      );

      await credential.user?.updateDisplayName(_controllerUsername.text);
      await _showDialog(context, "Success!", "Your account has been successfully created.");
      Navigator.of(context).pushNamedAndRemoveUntil(HomePage.ROUTE, (route) => false);

    } on FirebaseAuthException catch (e) {

      if (e.code == FirebaseExceptionUtilsSelection[FirebaseExceptionUtils.INVALID_EMAIL]) {
        _showDialog(context,
            "Invalid E-mail", "The email address is badly formatted, please, verify the insert e-mail");
        return;
      }

      if (e.code == FirebaseExceptionUtilsSelection[FirebaseExceptionUtils.WEAK_PASSWORD]) {
        _showDialog(context,
            "Weak Password", "The provided password it's too weak.");
        return;
      }

      if (e.code == FirebaseExceptionUtilsSelection[FirebaseExceptionUtils.EMAIL_IN_USE]) {
        _showDialog(context,
            "E-mail Already In Use", "The account already exists for that email.");
        return;
      }
    } catch (e) {
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