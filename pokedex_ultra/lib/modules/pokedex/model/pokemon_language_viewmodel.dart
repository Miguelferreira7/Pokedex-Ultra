class PokemonLanguageViewModel {
  String? name;
  String? url;

  PokemonLanguageViewModel({
    this.name,
    this.url
});

  factory PokemonLanguageViewModel.fromJson(Map<String, dynamic> json) {
    return new PokemonLanguageViewModel(
      name: json['name'],
      url: json['url'],
    );
  }

}