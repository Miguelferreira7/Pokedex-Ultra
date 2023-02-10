import 'pokemon_evolves_to_viewmodel.dart';

class PokemonEvolutionChainViewModel {
  List<PokemonEvolvesToViewModel>? evolves_to;

  PokemonEvolutionChainViewModel({this.evolves_to});

  static PokemonEvolutionChainViewModel fromJson(Map<String, dynamic> json) {
    return PokemonEvolutionChainViewModel(
      evolves_to: (json['evolves_to'] == null) ? []
          : (json['evolves_to'] as List).map((e) => PokemonEvolvesToViewModel.fromJson(e)).toList(),
    );
  }
}