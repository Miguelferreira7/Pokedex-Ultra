
import 'dart:convert';

import 'package:pokedex_ultra/api/i_pokemon_service.dart';
import 'package:pokedex_ultra/api/service.dart';
import 'package:pokedex_ultra/modules/pokedex/model/pokemon_evolution_chain.dart';
import 'package:pokedex_ultra/modules/pokedex/model/pokemon_species_viewmodel.dart';

class PokemonService extends Service implements IPokemonService {

  @override
  Future<String> getPokemonImage(String url) async {
    try {
      final response = await request(url, Service.HTTP_GET);
      return response!.body;
    } catch (e) {
      return "";
    }
  }

  @override
  Future<PokemonSpeciesViewModel> getPokemonDescription(String url) async {
    try {
      final response = await request(url, Service.HTTP_GET);

      return PokemonSpeciesViewModel.fromJson(jsonDecode(response!.body));
    } catch (e) {
      return new PokemonSpeciesViewModel();
    }
  }

  @override
  Future<PokemonEvolutionChainViewModel> getPokemonEvolutionChain(String url) async{
    try {
      final response = await request(url, Service.HTTP_GET);

      return PokemonEvolutionChainViewModel.fromJson(jsonDecode(response!.body));
    } catch (e) {
      return new PokemonEvolutionChainViewModel();
    }
  }
}