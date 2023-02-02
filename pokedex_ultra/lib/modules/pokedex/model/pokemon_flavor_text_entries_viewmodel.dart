import 'pokemon_language_viewmodel.dart';

class PokemonFlavorTextEntriesViewModel {
  String? flavorText;
  PokemonLanguageViewModel? language;

  PokemonFlavorTextEntriesViewModel({
    this.flavorText,
    this.language
  });

  static PokemonFlavorTextEntriesViewModel fromJson(Map<String, dynamic> json) {
    return new PokemonFlavorTextEntriesViewModel(
      flavorText: json['flavor_text'],
      language: (json["language"] == null)
        ? new PokemonLanguageViewModel()
        : PokemonLanguageViewModel.fromJson(json["language"])
    );
  }
}