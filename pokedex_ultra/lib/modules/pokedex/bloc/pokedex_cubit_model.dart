import 'package:flutter/material.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/utils/enums/generation_utils.dart';
import 'package:pokedex_ultra/utils/enums/pokedex_selection_enum.dart';

class PokedexCubitModel {
  bool? darkTheme;
  List<PokemonEntity>? pokemonList;
  PokedexSelectionEnum? option;
  Generation? generationSelected;
  PokemonEntity? pokemonSelected;
  Color? pokemonSelectedColor;
  String? pokemonSelectedDescription;

  PokedexCubitModel({
    this.darkTheme,
    this.pokemonList,
    this.option,
    this.pokemonSelected,
    this.pokemonSelectedColor,
    this.pokemonSelectedDescription,
    this.generationSelected
  });

  PokedexCubitModel patchState({
    bool? darkTheme,
    List<PokemonEntity>? pokemonList,
    PokedexSelectionEnum? option,
    PokemonEntity? pokemonSelected,
    Color? pokemonSelectedColor,
    String? pokemonSelectedDescription,
    Generation? generationSelected
  }) {

    return PokedexCubitModel(
      darkTheme: darkTheme ?? this.darkTheme,
      pokemonList: pokemonList ?? this.pokemonList,
      option: option ?? this.option,
      pokemonSelected: pokemonSelected ?? this.pokemonSelected,
      pokemonSelectedColor: pokemonSelectedColor ?? this.pokemonSelectedColor,
      pokemonSelectedDescription: pokemonSelectedDescription?? this.pokemonSelectedDescription,
      generationSelected: generationSelected ?? this.generationSelected
    );
  }
}
