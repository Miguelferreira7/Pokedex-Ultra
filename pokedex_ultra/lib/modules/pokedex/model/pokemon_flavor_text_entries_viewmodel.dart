import 'pokemon_game_version_viewmodel.dart';
import 'pokemon_language_viewmodel.dart';

class PokemonFlavorTextEntriesViewModel {
  String? flavorText;
  PokemonLanguageViewModel? language;
  PokemonGameVersionViewModel? version;

  PokemonFlavorTextEntriesViewModel({
    this.flavorText,
    this.language,
    this.version
  });

  factory PokemonFlavorTextEntriesViewModel.fromJson(Map<String, dynamic> json) {
    return new PokemonFlavorTextEntriesViewModel(
      flavorText: json['flavor_text'],
      language: (json["language"] == null)
        ? new PokemonLanguageViewModel()
        : PokemonLanguageViewModel.fromJson(json["language"]),
      version: (json["version"] == null)
          ? new PokemonGameVersionViewModel()
          : PokemonGameVersionViewModel.fromJson(json["version"])
    );
  }
}