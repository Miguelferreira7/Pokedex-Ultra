
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/dataBase/isar.dart';
import 'package:pokedex_ultra/utils/generation_utils.dart';
import 'package:pokedex_ultra/utils/pokedex_selection_enum.dart';
import 'pokedex_cubit_actions.dart';
import 'pokedex_cubit_model.dart';

class PokedexCubit extends Cubit<PokedexCubitModel> implements PokedexCubitActions {
  PokedexCubit() : super(PokedexCubitModel(
    darkTheme: true,
    pokemonList: [],
  ));

  IsarRepository isar = new IsarRepository();

  @override
  void setPokedexOrFavoritesSelected(PokedexSelectionEnum option) {
    emit(state.patchState(option: option));
  }

  @override
  Future<void> getPokedexCompleted(Generation generation) async {
    final List<PokemonEntity>? pokemons = await isar.getAllPokemons(generation);

    emit(state.patchState(pokemonList: pokemons));
  }
}
