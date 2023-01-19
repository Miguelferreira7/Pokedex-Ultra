import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/utils/pokedex_selection_enum.dart';

class PokedexCubitModel {
  bool? darkTheme;
  List<PokemonEntity>? pokemonList;
  PokedexSelectionEnum? option;

  PokedexCubitModel({
    this.darkTheme,
    this.pokemonList,
    this.option
  });

  PokedexCubitModel patchState({
    bool? darkTheme,
    List<PokemonEntity>? pokemonList,
    PokedexSelectionEnum? option,
  }) {

    return PokedexCubitModel(
      darkTheme: darkTheme ?? this.darkTheme,
      pokemonList: pokemonList ?? this.pokemonList,
      option: option ?? this.option
    );
  }
}
