import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit_model.dart';
import 'package:pokedex_ultra/utils/pokemon_type_utils.dart';

class PokemonListPage extends StatelessWidget {
  static final String ROUTE = "/pokemons-list";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexCubitModel>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("POKEMONS", style: TextStyle(fontSize: 24),),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, PokedexCubitModel state) {
    return _buildListViewPokemons(context, state);
  }

  Widget _buildListViewPokemons(BuildContext _context, PokedexCubitModel state) {

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(_context).size.width,
        height: MediaQuery.of(_context).size.height,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: state.pokemonList!.length,
          itemBuilder: (BuildContext context, int index) {
            final pokemon = state.pokemonList![index];
            Color pokemonColor = Colors.grey;

            if (pokemon.types?.length == 2 &&
                pokemon.types?[0].type == TypeUtilsSelection[TypeUtils.NORMAL] &&
                pokemon.types?[1].type == TypeUtilsSelection[TypeUtils.FLYING]) {
              pokemonColor = validateColorType(pokemon.types?[1].type);
            } else {
              pokemonColor = validateColorType(pokemon.types?.first.type);
            }

            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                height: MediaQuery.of(context).size.height * 0.14,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: pokemonColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildPokemonNumber(context, state.pokemonList![index].number),
                    _buildPokemonName(context, state.pokemonList![index].name, pokemonColor),
                    Row(children: _buildPokemonTypesContainer(context, state, index))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPokemonNumber(context, int? numPokemon) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        '#${numPokemon}',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildPokemonName(context, String? nomePokemon, corPokemon) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.030,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        '${nomePokemon?.toUpperCase()}',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }

  List<Widget> _buildPokemonTypesContainer(BuildContext context, PokedexCubitModel state, int index) {
    List<Widget> types = [];


    if (state.pokemonList![index].types != null && state.pokemonList![index].types!.isNotEmpty) {

      for (int i = 0; i < state.pokemonList![index].types!.length; i++) {
        final typeIndex = state.pokemonList![index].types![i].type;
        Color TypeColor = validateColorType(typeIndex);

        types.add(
            Container(
              child: Text("$typeIndex".toUpperCase(), style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11
              )),

              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 8),
              width: 62,
              height: 18,
              decoration: BoxDecoration(
                color: TypeColor,
                borderRadius: BorderRadius.circular(4),
              ),
            )
        );
      }
    }
    return types;
  }
}