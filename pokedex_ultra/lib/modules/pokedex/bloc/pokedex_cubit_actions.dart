import 'package:flutter/material.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/utils/enums/generation_utils.dart';

import '../../../utils/enums/pokedex_selection_enum.dart';

abstract class PokedexCubitActions{

  void updatePokedexOrFavoritesSelected(PokedexSelectionEnum option);

  Future<void> getPokedexByGeneration(Generation generation);

  Future<void> updateSelectedPokemonOptions(PokemonEntity pokemonSelected, Color pokemonColor);

  void updatePokemonfavoriteStatus();

  void updateGenerationSelected(Generation generationSelected);

  Future<void> updatePokemonSelectedDescription();

}