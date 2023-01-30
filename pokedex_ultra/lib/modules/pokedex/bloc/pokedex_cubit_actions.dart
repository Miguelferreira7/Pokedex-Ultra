import 'package:flutter/material.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/utils/generation_utils.dart';

import '../../../utils/pokedex_selection_enum.dart';

abstract class PokedexCubitActions{

  void setPokedexOrFavoritesSelected(PokedexSelectionEnum option);

  Future<void> getPokedexCompleted(Generation generation);

  Future<void> updateSelectedPokemonOptions(PokemonEntity pokemonSelected, Color pokemonColor);
}