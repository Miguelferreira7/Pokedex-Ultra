import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit.dart';
import 'package:pokedex_ultra/modules/pokedex/bloc/pokedex_cubit_model.dart';
import 'package:pokedex_ultra/utils/enums/generation_utils.dart';
import 'package:pokedex_ultra/utils/enums/image_utils.dart';
import 'package:pokedex_ultra/utils/enums/pokedex_selection_enum.dart';
import '../../pokedex/pages/pokemons_list_page.dart';

class HomeGenerationsModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexCubit, PokedexCubitModel>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 8),
          color: Theme.of(context).colorScheme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTitle(context),
              _buildOptions(context),
              _buildCancelButton(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(
        "Select One Generation".toUpperCase(),
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          _buildPokemonImages(
              context,
              "FIRST GENERATION",
              Generation.FIRST_GENERATION,
              Image.asset(ImageUtilsSelection[ImageUtils.CHARMANDER]!,
                  scale: 1.2, color: Colors.redAccent.withOpacity(0.8)),
              Image.asset(ImageUtilsSelection[ImageUtils.BULBASAUR]!,
                  scale: 1.2, color: Colors.green.withOpacity(0.8)),
              Image.asset(ImageUtilsSelection[ImageUtils.SQUIRTLE]!,
                  scale: 1.2, color: Colors.blueAccent.withOpacity(0.8))),
          _buildPokemonImages(
              context,
              "SECOND GENERATION",
              Generation.SECOND_GENERATION,
              Image.asset(ImageUtilsSelection[ImageUtils.CYNDAQUIL]!,
                  scale: 1.2, color: Colors.redAccent.withOpacity(0.8)),
              Image.asset(ImageUtilsSelection[ImageUtils.CHIKORITA]!,
                  scale: 1.2, color: Colors.green.withOpacity(0.8)),
              Image.asset(ImageUtilsSelection[ImageUtils.TOTODILE]!,
                  scale: 1.2, color: Colors.blueAccent.withOpacity(0.8))),
          _buildPokemonImages(
              context,
              "THIRD GENERATION",
              Generation.THIRD_GENERATION,
              Image.asset(ImageUtilsSelection[ImageUtils.TORCHIC]!,
                  scale: 1.1, color: Colors.redAccent.withOpacity(0.8)),
              Image.asset(ImageUtilsSelection[ImageUtils.MUDKIP]!,
                  scale: 1.1, color: Colors.green.withOpacity(0.8)),
              Image.asset(ImageUtilsSelection[ImageUtils.TREECKO]!,
                  scale: 1.1, color: Colors.blueAccent.withOpacity(0.8))),
          _buildPokemonImages(
              context,
              "FOURTH GENERATION",
              Generation.FOURTH_GENERATION,
              Image.asset(ImageUtilsSelection[ImageUtils.CHIMCHAR]!,
                  scale: 1.0, color: Colors.redAccent.withOpacity(0.8)),
              Image.asset(ImageUtilsSelection[ImageUtils.TURTWIG]!,
                  scale: 1.0, color: Colors.green.withOpacity(0.8)),
              Image.asset(ImageUtilsSelection[ImageUtils.PIPLUP]!,
                  scale: 1.0, color: Colors.blueAccent.withOpacity(0.8))),
        ],
      ),
    );
  }

  Widget _buildPokemonImages(
      BuildContext context,
      String generationName,
      Generation generation,
      Image pokemonImage1,
      Image pokemonImage2,
      Image pokemonImage3) {
    return BlocBuilder<PokedexCubit, PokedexCubitModel>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () => _getGenerationSelectedFunction(context, generation, state),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [pokemonImage1, pokemonImage2, pokemonImage3],
                ),
              ),
              Container(
                child: Text(
                  generationName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(Icons.arrow_forward_ios,
                    size: 16, color: Theme.of(context).colorScheme.tertiary),
              )
            ],
          ),
        ),
      );
    });
  }

  _getGenerationSelectedFunction(BuildContext context, Generation generation,
      PokedexCubitModel state) async {

    context.read<PokedexCubit>().updateGenerationSelected(generation);
    await context.read<PokedexCubit>().getPokedexByGeneration(generation);
    Navigator.of(context).pushNamed(PokemonListPage.ROUTE);
  }

  Widget _buildCancelButton(BuildContext context) {
    return Container(
      height: 32,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.tertiary),
        ),
        child: Text("Cancel", style: Theme.of(context).textTheme.button),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
