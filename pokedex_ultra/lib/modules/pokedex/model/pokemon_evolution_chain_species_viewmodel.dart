class PokemonEvolutionChainSpeciesViewModel {
  String? name;
  String? url;

  PokemonEvolutionChainSpeciesViewModel({this.name, this.url});

  static PokemonEvolutionChainSpeciesViewModel fromJson(Map<String, dynamic> json) {
    return PokemonEvolutionChainSpeciesViewModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}