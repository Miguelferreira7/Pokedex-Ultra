import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/stats_entity.dart';

import '../bloc/pokedex_cubit.dart';
import '../bloc/pokedex_cubit_model.dart';

class PokemonTabBarView extends StatelessWidget {
  const PokemonTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexCubitModel>(
        builder: (context, state) {
      final pokemon = state.pokemonSelected!;

      return Container(
        padding: const EdgeInsets.only(top: 16),
        height: MediaQuery.of(context).size.height / 2.3,
        child: TabBarView(
          children: [
            _buildAboutTabBarView(context, pokemon, state),
            _buildStatsTabBarView(context, pokemon, state),
            _buildMovesTabBarView(context, pokemon),
            _buildEvolutionTabBarView(context, pokemon)
          ],
        ),
      );
    });
  }

  Widget _buildAboutTabBarView(
      BuildContext context, PokemonEntity pokemon, PokedexCubitModel state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.white))),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.fitness_center),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        child: Text('${pokemon.weight} kg',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 4, left: 4),
                    child: Text('Weight',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.height),
                      Container(
                          margin: const EdgeInsets.only(left: 4),
                          child: Text(
                            '${pokemon.height} m',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 4),
                    child: Text('Height',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400)),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Text(
            state.pokemonSelectedDescription!,
            style: TextStyle(color: Colors.white, letterSpacing: 0.2),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }

  Widget _buildStatsTabBarView(
      BuildContext context, PokemonEntity pokemon, PokedexCubitModel state) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .35,
            child: Column(
              children: _buildLabelStats(context, pokemon.stats),
            ),
          ),
          Container(
            width: 25,
            child: Column(
              children: _buildValueStats(context, pokemon.stats),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            child: Column(
              children: _buildLinearPercentIndicatorStats(
                  context, pokemon.stats, state),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildLabelStats(
      BuildContext context, List<StatsEntity>? pokemonStats) {
    List<Widget> stats = [];

    pokemonStats!.forEach((element) {
      stats.add(Container(
          height: MediaQuery.of(context).size.width * .05,
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          alignment: Alignment.centerLeft,
          child: Text("${element.name!.toUpperCase()}",
              textAlign: TextAlign.left)));
    });

    return stats;
  }

  List<Widget> _buildValueStats(
      BuildContext context, List<StatsEntity>? pokemonStats) {
    List<Widget> stats = [];

    pokemonStats!.forEach((element) {
      stats.add(Container(
        height: MediaQuery.of(context).size.width * .05,
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        alignment: Alignment.center,
        child: Text(
          "${element.baseStat}",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ));
    });

    return stats;
  }

  List<Widget> _buildLinearPercentIndicatorStats(BuildContext context,
      List<StatsEntity>? pokemonStats, PokedexCubitModel state) {
    List<Widget> stats = [];

    pokemonStats!.forEach((element) {
      stats.add(Container(
        height: MediaQuery.of(context).size.width * .05,
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
        child: LinearPercentIndicator(
          progressColor: state.pokemonSelectedColor!,
          barRadius: Radius.circular(8),
          width: MediaQuery.of(context).size.width * .47,
          percent: 0.5,
          lineHeight: 16.0,
        ),
      ));
    });

    return stats;
  }

  Widget _buildMovesTabBarView(BuildContext context, PokemonEntity pokemon) {
    return Center(
      child: Text("Moves"),
    );
  }

  Widget _buildEvolutionTabBarView(
      BuildContext context, PokemonEntity pokemon) {
    return Center(
      child: Text("Evolution"),
    );
  }
}
