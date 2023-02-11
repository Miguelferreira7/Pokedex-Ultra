import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit_model.dart';
import 'package:pokedex_ultra/modules/pokedex/pages/pokemon_detail_tab_bar.dart';
import 'package:pokedex_ultra/utils/enums/image_utils.dart';
import 'package:pokedex_ultra/utils/enums/pokemon_type_utils.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  static final String ROUTE = "/pokemon-details-page";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexCubitModel>(
      builder: (context, state) {

        PokedexCubit _bloc = BlocProvider.of<PokedexCubit>(context);


        final pokemon = state.pokemonSelected!;
        return DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: state.pokemonSelectedColor,
              centerTitle: false,
              title: Text(
                "${pokemon.name?.toUpperCase()}",
                style: Theme.of(context).textTheme.headline1,
              ),
              actions: [
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  alignment: Alignment.center,
                  child: Text(
                    "#${pokemon.number}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )
              ],
            ),
            body: _buildBody(context, pokemon, state.pokemonSelectedColor),
          ),
        );
      },
    );
  }

  Widget _buildBody(
      BuildContext context, PokemonEntity pokemon, Color? pokemonColor) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      margin: EdgeInsets.zero,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            _buildTabView(context, pokemon, pokemonColor!),
            _buildBackgroundImage(context, pokemonColor),
            _buildFavoriteButton(context, pokemon),
            _buildPokemonImage(context, pokemon)
          ],
        ),
      ),
    );
  }

  Widget _buildTabView(
      BuildContext context, PokemonEntity pokemon, Color pokemonColor) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: _buildPokemonTypes(pokemon, pokemonColor),
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          _buildTabViewTitles(context, pokemonColor),
          PokemonTabBarView(),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context, PokemonEntity pokemon) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.27,
      right: MediaQuery.of(context).size.width / 16,
      child: IconButton(

        icon: Icon(
          Icons.favorite,
          size: 30,
          color: pokemon.isFavorite == true ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          PokedexCubit _bloc = BlocProvider.of<PokedexCubit>(context);
          _bloc.updatePokemonfavoriteStatus();
        },
      ),
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

  Widget _buildTabViewTitles(BuildContext context, Color? pokemonColor) {
    TextStyle? tabTextStyle =
        Theme.of(context).textTheme.headline3?.copyWith(color: pokemonColor);

    return TabBar(
        padding: const EdgeInsets.only(top: 8),
        indicatorPadding: EdgeInsets.only(bottom: 8),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(),
        tabs: [
          Tab(child: Text("About", style: tabTextStyle)),
          Tab(child: Text("Stats", style: tabTextStyle)),
          Tab(child: Text("Moves", style: tabTextStyle)),
          Tab(child: Text("Evolutions", style: tabTextStyle))
        ]);
  }

  Widget _buildBackgroundImage(context, Color? pokemonColor) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: pokemonColor,
      ),
      child: Container(
        child: Image.asset(
          ImageUtilsSelection[ImageUtils.POKEBALL]!,
          color: const Color.fromRGBO(255, 255, 255, 0.1),
          alignment: Alignment.topRight,
        ),
      ),
    );
  }

  Widget _buildPokemonImage(context, PokemonEntity pokemon) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .001,
      right: MediaQuery.of(context).size.width / 3.66,
      child: Hero(
        tag: 'pokemon-image-${pokemon.number}',
        child: Image.network(
          '${pokemon.urlSprite}',
          height: MediaQuery.of(context).size.height * 0.42,
          width: MediaQuery.of(context).size.width * 0.48,
          scale: 0.048,
        ),
      ),
    );
  }
}
