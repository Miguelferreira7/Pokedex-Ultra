class PokemonGameVersionViewModel {
  String? name;
  String? url;

  PokemonGameVersionViewModel({
    this.name,
    this.url
  });

  factory PokemonGameVersionViewModel.fromJson(Map<String, dynamic> json) {
    return new PokemonGameVersionViewModel(
      name: json['name'],
      url: json['url'],
    );
  }
}