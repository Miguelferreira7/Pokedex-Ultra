import 'package:pokedex_ultra/modules/pokedex/model/pokemon_evolution_chain.dart';
import 'package:pokedex_ultra/modules/pokedex/model/pokemon_species_viewmodel.dart';

abstract class IPokemonService{
  Future<String> getPokemonImage(String url);
  Future<PokemonSpeciesViewModel> getPokemonDescription(String url);
  Future<PokemonEvolutionChainViewModel> getPokemonEvolutionChain(String url);
}