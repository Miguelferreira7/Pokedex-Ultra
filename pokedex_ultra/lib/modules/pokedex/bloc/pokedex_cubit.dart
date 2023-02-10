
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/dataBase/isar.dart';
import 'package:pokedex_ultra/settings/appSettings.dart';
import 'package:pokedex_ultra/utils/enums/generation_utils.dart';
import 'package:pokedex_ultra/utils/enums/pokedex_selection_enum.dart';
import 'pokedex_cubit_actions.dart';
import 'pokedex_cubit_model.dart';

class PokedexCubit extends Cubit<PokedexCubitModel> implements PokedexCubitActions {
  PokedexCubit() : super(PokedexCubitModel(
    darkTheme: true,
    pokemonList: [],
    pokemonSelectedDescription: '',
  ));

  IsarRepository isar = new IsarRepository();

  @override
  void setPokedexOrFavoritesSelected(PokedexSelectionEnum option) {
    emit(state.patchState(option: option));
  }

  @override
  Future<void> getPokedexByGeneration(Generation generation) async {
    List<PokemonEntity>? pokemons = await isar.getAllPokemons(generation);

    if (pokemons!.isNotEmpty) {
      emit(state.patchState(pokemonList: pokemons));
    } else {
      AppSettings appSettings = new AppSettings();
      pokemons = await appSettings.searchPokemonsByGeneration(generation);

      emit(state.patchState(pokemonList: pokemons));
    }
  }

  @override
  Future<void> updateSelectedPokemonOptions(PokemonEntity pokemonSelected, Color pokemonColor) async {
    emit(state.patchState(
        pokemonSelected: pokemonSelected,
        pokemonSelectedColor: pokemonColor
    ));
  }

  @override
  void updatePokemonfavoriteStatus() async {
    PokemonEntity pokemon = state.pokemonSelected!;
    pokemon.isFavorite = !pokemon.isFavorite!;

    await isar.updatePokemonFavoriteStatus(pokemon);
    emit(state.patchState(pokemonSelected: pokemon));
  }

  @override
  Future<void> updatePokemonSelectedDescription() async {
    String pokemondescription = state.pokemonSelected!.description![0].descriptionText!;

    emit(state.patchState(pokemonSelectedDescription: pokemondescription));
  }
}
