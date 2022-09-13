class User {
  String? email;
  String? senha;

  User ({
    this.email,
    this.senha
  });

  static User fromJson(Map<String, dynamic> json) {
    return new User(
      email: json["email"],
      senha: json["senha"]
    );
  }

  Map toMap() {
    return {
      "email": this.email,
      "senha": this.senha
    };
  }
}