import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokedex_ultra/modules/login/components/cadastro.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static final String ROUTE = "/sign-in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        toolbarHeight: 60,
        title: new Text("LOGIN"),
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
              new Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 16, left: 8),
                child: GestureDetector(
                  child: new Text("Esqueceu a senha?",
                      style: _mainTheme.textTheme.subtitle1?.copyWith(fontSize: 18)),
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
                  child: new Text("Entrar", style: _mainTheme.textTheme.button),
                  onPressed: () {
                    EasyLoading.show(status: "carregando");
                  },
                ),
              ),
              new Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 16, left: 8),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(SignUpScreen.ROUTE),
                  child: new Text("Não possui conta? CADASTRE-SE!",
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
