import 'package:pokedex_ultra/modules/pokedex/model/pokemon_flavor_text_entries_viewmodel.dart';

class PokemonSpeciesViewModel {

  List<PokemonFlavorTextEntriesViewModel>? flavorTextEntries ;
  String? evolutionChainUrl;
  bool? isLegendary;

  PokemonSpeciesViewModel({
    this.isLegendary,
    this.flavorTextEntries,
    this.evolutionChainUrl
  });

  factory PokemonSpeciesViewModel.fromJson(Map<String, dynamic> json) {
    return new PokemonSpeciesViewModel(
      isLegendary: json['is_legendary'],
      evolutionChainUrl: json['evolution_chain']['url'],
      flavorTextEntries: (json["flavor_text_entries"] != null)
          ? (json["flavor_text_entries"] as List).map((x) =>
          PokemonFlavorTextEntriesViewModel.fromJson(x)).toList() : [],
    );
  }
}