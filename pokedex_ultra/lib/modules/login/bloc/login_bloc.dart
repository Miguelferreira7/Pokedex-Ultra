import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_cubit_actions.dart';
import 'package:pokedex_ultra/modules/login/bloc/login_cubit_model.dart';

class LoginCubit extends Cubit<LoginCubitModel> implements LoginCubitActions {
  LoginCubit() : super(LoginCubitModel());



}
