import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/types_entity.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit_model.dart';
import 'package:pokedex_ultra/modules/pokedex/pages/pokemon_details_page.dart';
import 'package:pokedex_ultra/utils/enums/pokemon_type_utils.dart';

class PokemonListPage extends StatelessWidget {
  static final String ROUTE = "/pokemons-list";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexCubitModel>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "POKEMONS",
              style: const TextStyle(fontSize: 24),
            ),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, PokedexCubitModel state) {
    if (state.pokemonList != null || state.pokemonList!.isNotEmpty) {
      return _buildListViewPokemons(context, state);
    } else {
      return Container();
    }
  }

  Widget _buildListViewPokemons(
      BuildContext _context, PokedexCubitModel state) {
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
            pokemonColor = _getColorTypePokemon(pokemon.types);

            return _buildPokemonCard(context, pokemon, pokemonColor);
          },
        ),
      ),
    );
  }

  Widget _buildPokemonCard(
      BuildContext context, PokemonEntity pokemon, Color pokemonColor) {
    return Container(
      child: GestureDetector(
        onTap: () async {
          PokedexCubit _bloc = BlocProvider.of<PokedexCubit>(context);
          await _bloc.updateSelectedPokemonOptions(pokemon, pokemonColor);
          await _bloc.updatePokemonSelectedDescription();
          Navigator.of(context).pushNamed(PokemonDetailsPage.ROUTE);
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          height: MediaQuery.of(context).size.height * 0.14,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: pokemonColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPokemonNumber(context, pokemon.number),
                    _buildPokemonName(context, pokemon.name, pokemonColor),
                    Row(children: _buildPokemonTypesContainer(context, pokemon))
                  ],
                ),
              ),
              _buildPokemonImage(context, pokemon)
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorTypePokemon(List<TypesEntity>? type) {
    if (type?.length == 2 &&
        type?[0].type == TypeUtilsSelection[TypeUtils.NORMAL] &&
        type?[1].type == TypeUtilsSelection[TypeUtils.FLYING]) {
      return GetColorType(type?[1].type);
    } else {
      return GetColorType(type?.first.type);
    }
  }

  Widget _buildPokemonNumber(context, int? numPokemon) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        '#${numPokemon}',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
      child: Text(
        '${nomePokemon?.toUpperCase()}',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  List<Widget> _buildPokemonTypesContainer(
      BuildContext context, PokemonEntity pokemon) {
    List<Widget> types = [];

    if (pokemon.types != null && pokemon.types!.isNotEmpty) {
      for (int i = 0; i < pokemon.types!.length; i++) {
        final typeIndex = pokemon.types![i].type;
        Color TypeColor = GetColorType(typeIndex);

        types.add(Container(
          child: Text("$typeIndex".toUpperCase(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 8),
          width: 62,
          height: 18,
          decoration: BoxDecoration(
            color: TypeColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ));
      }
    }
    return types;
  }

  Widget _buildPokemonImage(BuildContext context, PokemonEntity pokemon) {
    return Container(
      child: Hero(
        tag: 'pokemon-image-${pokemon.number}',
        child: Image.network("${pokemon.urlSprite}", scale: 0.4),
      ),
    );
  }
}
