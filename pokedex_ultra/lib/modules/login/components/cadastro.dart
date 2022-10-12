import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static final String ROUTE = "/sign-up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        toolbarHeight: 60,
        title: const Text("SIGN-UP!"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    ThemeData _Theme = Theme.of(context);
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
              new Container(
                alignment: Alignment.centerLeft,
                child: new TextField(
                  decoration: const InputDecoration(label: const Text("E-mail")),
                ),
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: new BoxDecoration(
                    color: _Theme.splashColor,
                    border: new Border.all(width: 1),
                    borderRadius: new BorderRadius.all(new Radius.circular(10))
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const TextField(
                  decoration: const InputDecoration(label: const Text("Password")),
                ),
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: new BoxDecoration(
                    color: _Theme.splashColor,
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                alignment: Alignment.centerLeft,
                child: const TextField(
                  decoration: InputDecoration(label: const Text("Confirm your password")),
                ),
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: _Theme.splashColor,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _Theme.colorScheme.secondary
                    ),
                  ),
                  child: Text("SIGN-UP", style: _Theme.textTheme.button),
                  onPressed: () {},
                ),
              )
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
                child: Text("Privacy policy and use terms",
                    style: _Theme.textTheme.subtitle1),
              )
            ],
          )
        ],
      ),
    );
  }
}
