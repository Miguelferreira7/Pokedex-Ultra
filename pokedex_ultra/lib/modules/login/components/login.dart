import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_bloc.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_cubit_model.dart';
import 'package:pokedex_ultra/modules/login/components/cadastro.dart';
import 'package:pokedex_ultra/utils/components/components.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static final String ROUTE = "/sign-in";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginCubitModel>(
      bloc: BlocProvider.of<LoginCubit>(context),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            title: const Text("LOGIN"),
          ),
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {

    ThemeData _mainTheme = Theme.of(context);
    TextEditingController controllerEmail = new TextEditingController();


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
                  label: "E-mail",
                  controller: controllerEmail,
                  title: "E-mail",
                  focusNode: new FocusNode(),
                  keyboardType: TextInputType.text,
                  onChange: (value) { }),
              new Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 16, left: 8),
                child: GestureDetector(
                  child: new Text("Esqueceu a senha?",
                      style: _mainTheme.textTheme.subtitle1
                          ?.copyWith(fontSize: 18)),
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(top: 16),
                child: new ElevatedButton(
                  style: new ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        _mainTheme.colorScheme.secondary),
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
                  onTap: () =>
                      Navigator.of(context).pushNamed(SignUpScreen.ROUTE),
                  child: new Text("Não possui conta? CADASTRE-SE!",
                      style: _mainTheme.textTheme.subtitle1
                          ?.copyWith(fontSize: 18)),
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
