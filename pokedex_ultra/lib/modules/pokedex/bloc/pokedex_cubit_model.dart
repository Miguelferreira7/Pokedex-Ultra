import 'package:flutter/material.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/utils/pokedex_selection_enum.dart';

class PokedexCubitModel {
  bool? darkTheme;
  List<PokemonEntity>? pokemonList;
  PokedexSelectionEnum? option;
  PokemonEntity? pokemonSelected;
  Color? pokemonSelectedColor;

  PokedexCubitModel({
    this.darkTheme,
    this.pokemonList,
    this.option,
    this.pokemonSelected,
    this.pokemonSelectedColor
  });

  PokedexCubitModel patchState({
    bool? darkTheme,
    List<PokemonEntity>? pokemonList,
    PokedexSelectionEnum? option,
    PokemonEntity? pokemonSelected,
    Color? pokemonSelectedColor
  }) {

    return PokedexCubitModel(
      darkTheme: darkTheme ?? this.darkTheme,
      pokemonList: pokemonList ?? this.pokemonList,
      option: option ?? this.option,
      pokemonSelected: pokemonSelected ?? this.pokemonSelected,
      pokemonSelectedColor: pokemonSelectedColor ?? this.pokemonSelectedColor
    );
  }
}
