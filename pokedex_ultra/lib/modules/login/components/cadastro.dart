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
        title: new Text("CADASTRE-SE!"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
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
              new Container(
                alignment: Alignment.centerLeft,
                child: new TextField(
                  decoration: new InputDecoration(label: Text("E-mail")),
                ),
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: new BoxDecoration(
                    color: _mainTheme.splashColor,
                    border: new Border.all(width: 1),
                    borderRadius: new BorderRadius.all(new Radius.circular(10))
                ),
              ),
              new Container(height: 25),
              new Container(
                alignment: Alignment.centerLeft,
                child: new TextField(
                  decoration: new InputDecoration(label: new Text("Senha")),
                ),
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: new BoxDecoration(
                    color: _mainTheme.splashColor,
                    border: new Border.all(width: 1),
                    borderRadius: new BorderRadius.all(Radius.circular(10))
                ),
              ),
              new Container(height: 25),
              new Container(
                alignment: Alignment.centerLeft,
                child: new TextField(
                  decoration: new InputDecoration(label: new Text("Confirme sua senha")),
                ),
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: new BoxDecoration(
                    color: _mainTheme.splashColor,
                    border: new Border.all(width: 1),
                    borderRadius: new BorderRadius.all(Radius.circular(10))
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(top: 16),
                child: new ElevatedButton(
                  style: new ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _mainTheme.colorScheme.secondary
                    ),
                  ),
                  child: new Text("Cadastrar", style: _mainTheme.textTheme.button),
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
                child: new Text("Termos de Uso e Politica de Privacidade",
                    style: _mainTheme.textTheme.subtitle1),
              )
            ],
          )
        ],
      ),
    );
  }
}
