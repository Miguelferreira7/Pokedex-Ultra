import 'package:pokedex_ultra/modules/pokedex/model/pokemon_evolution_chain_species_viewmodel.dart';

class PokemonEvolvesToViewModel {
  List<PokemonEvolvesToViewModel>? evolves_to;
  PokemonEvolutionChainSpeciesViewModel? species;

  PokemonEvolvesToViewModel({this.evolves_to, this.species});

  static PokemonEvolvesToViewModel fromJson(Map<String, dynamic> json) {
    return PokemonEvolvesToViewModel(
      evolves_to: (json['evolves_to'] == null) ? []
          : (json['evolves_to'] as List).map((e) =>
          PokemonEvolvesToViewModel.fromJson(e)).toList(),
      species: json['species'] as PokemonEvolutionChainSpeciesViewModel,
    );
  }
}