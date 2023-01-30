class PokemonDescriptionViewModel {

  String description;
  bool isLegendary;

  PokemonDescriptionViewModel({
    required this.description,
    required this.isLegendary
  });

  static PokemonDescriptionViewModel fromJson(Map<String, dynamic> json) {
    return new PokemonDescriptionViewModel(
      description: json['description'],
      isLegendary: json['is_legendary'],
    );
  }
}