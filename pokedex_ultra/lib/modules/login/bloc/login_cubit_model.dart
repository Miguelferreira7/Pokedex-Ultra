class LoginCubitModel {
  String? oi;

  LoginCubitModel({this.oi});

  LoginCubitModel patchState({String? oi}) {
    return LoginCubitModel(oi: oi ?? this.oi);
  }
}
