import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit_model.dart';
import 'package:pokedex_ultra/utils/pokemon_type_utils.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  static final String ROUTE = "/pokemon-details-page";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexCubitModel>(
      builder: (context, state) {
        final pokemon = state.pokemonSelected!;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: state.pokemonSelectedColor,
            title: Text(
              "${pokemon.name!.toUpperCase()}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: _buildBody(context, pokemon, state.pokemonSelectedColor),
        );
      },
    );
  }

  Widget _buildBody(
      BuildContext context, PokemonEntity pokemon, Color? pokemonColor) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 25, 10, 20),
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: _buildPokemonTypes(pokemon, pokemonColor),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  _buildPokemonDescription(pokemon, pokemonColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPokemonWeightCard(pokemon.weight),
                      _buildPokemonHeightCard(pokemon.height),
                    ],
                  )
                ],
              ),
            ),
            _buildBackgroundImage(context, pokemonColor),
            _buildFavoriteButton(context, pokemon),
            _buildPokemonImage(context, pokemon)
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context, PokemonEntity pokemon) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.27,
      right: MediaQuery.of(context).size.width / 18,
      child: GestureDetector(
        child: Icon(
          size: 30,
          Icons.favorite,
          color: pokemon.isFavorite == true ? Colors.red : Colors.grey,
        ),
        onTap: () {
          PokedexCubit _bloc = BlocProvider.of<PokedexCubit>(context);
          _bloc.updatePokemonfavoriteStatus();
        }),
    );
  }

  List<Widget> _buildPokemonTypes(PokemonEntity pokemon, Color? pokemonColor) {
    List<Widget> listTypesWidgets = [];

    pokemon.types?.forEach((element) {
      Color pokemonColor = Colors.grey;
      pokemonColor = GetColorType(element.type);

      listTypesWidgets.add(Container(
        margin: const EdgeInsets.only(right: 8, left: 8),
        alignment: Alignment.center,
        width: 80,
        height: 30,
        decoration: BoxDecoration(
          color: pokemonColor,
          border: Border.all(color: Colors.transparent, width: 2.5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Text("${element.type?.toUpperCase()}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ));
    });

    return listTypesWidgets;
  }

  Widget _buildPokemonDescription(PokemonEntity pokemon, Color? pokemonColor) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 12),
        child: Text(
          "Special informations",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: pokemonColor,
          ),
        ));
  }

  Widget _buildBackgroundImage(context, Color? pokemonColor) {
    return Container(
      margin: EdgeInsets.all(0),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: pokemonColor,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Image.asset(
          'assets/Pokeball.png',
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          alignment: Alignment.topRight,
        ),
      ),
    );
  }

  Widget _buildPokemonHeightCard(int? pokeHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(50, 0, 5, 5),
          child: Text('$pokeHeight m',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(50, 0, 5, 5),
          child: Text('Height',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
        )
      ],
    );
  }

  Widget _buildPokemonWeightCard(int? pokeWeight) {

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
            child: Text('${pokeWeight} kg',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
            child: Text('Weight',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }

  Widget _buildPokemonImage(context, PokemonEntity pokemon) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.02,
      right: MediaQuery.of(context).size.width / 3.66,
      child: Image.network(
        '${pokemon.urlSprite}',
        height: MediaQuery.of(context).size.height * 0.42,
        width: MediaQuery.of(context).size.width * 0.48,
        scale: 0.048,

      ),
    );
  }
}
