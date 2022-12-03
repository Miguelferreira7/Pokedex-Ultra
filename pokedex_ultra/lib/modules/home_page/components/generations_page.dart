import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/home_page/bloc/pokemon_bloc.dart';
import 'package:pokedex_ultra/modules/home_page/bloc/pokemon_cubit_model.dart';
import 'package:pokedex_ultra/utils/generation_enum.dart';
import 'package:pokedex_ultra/utils/image_utils.dart';

class GenerationsPage extends StatelessWidget {
  const GenerationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonCubitModel>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 8),
          color: Theme.of(context).colorScheme.background,
          child: Column(
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
        "Select One Generation",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          _buildPokemonImages(context,
              "FIRST GENERATION", Generation.FIRST_GENERATION,
              Image.asset(ImageUtilsSelection[ImageUtils.CHARMANDER]!, scale: 1.2),
              Image.asset(ImageUtilsSelection[ImageUtils.BULBASAUR]!, scale: 1.2),
              Image.asset(ImageUtilsSelection[ImageUtils.SQUIRTLE]!, scale: 1.2)
          ),
          _buildPokemonImages(context,
              "SECOND GENERATION", Generation.SECOND_GENERATION,
              Image.asset(ImageUtilsSelection[ImageUtils.CYNDAQUIL]!, scale: 1.2),
              Image.asset(ImageUtilsSelection[ImageUtils.CHIKORITA]!, scale: 1.2),
              Image.asset(ImageUtilsSelection[ImageUtils.TOTODILE]!, scale: 1.2)
          ),
          _buildPokemonImages(context,
              "THIRD GENERATION", Generation.THIRD_GENERATION,
              Image.asset(ImageUtilsSelection[ImageUtils.TORCHIC]!, scale: 1.1),
              Image.asset(ImageUtilsSelection[ImageUtils.MUDKIP]!, scale: 1.1),
              Image.asset(ImageUtilsSelection[ImageUtils.TREECKO]!, scale: 1.1)
          ),
          _buildPokemonImages(context,
              "FOURTH GENERATION", Generation.FOURTH_GENERATION,
              Image.asset(ImageUtilsSelection[ImageUtils.CHIMCHAR]!, scale: 1.1),
              Image.asset(ImageUtilsSelection[ImageUtils.TURTWIG]!, scale: 1.1),
              Image.asset(ImageUtilsSelection[ImageUtils.PIPLUP]!, scale: 1.1)
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonImages(
      BuildContext context,
      String generationName, Generation generation,
      Image pokemonImage1, Image pokemonImage2, Image pokemonImage3) {

    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  pokemonImage1,
                  pokemonImage2,
                  pokemonImage3
                ],
              ),
            ),
            Container(
              child: Text(
                generationName,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).colorScheme.tertiary
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return new Container(
      height: 32,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(top: 8),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.tertiary),
        ),
        child: Text("CANCEL", style: Theme.of(context).textTheme.button),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}