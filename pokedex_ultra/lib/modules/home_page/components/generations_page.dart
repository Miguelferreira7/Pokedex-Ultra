import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/home_page/bloc/pokemon_bloc.dart';
import 'package:pokedex_ultra/modules/home_page/bloc/pokemon_cubit_model.dart';

import '../../../utils/imageUtils.dart';

class GenerationsPage extends StatelessWidget {
  const GenerationsPage({Key? key}) : super(key: key);
  static final String ROUTE = "/generations_page";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonCubitModel>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(

          ),
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 8, right: 8),
      child: Column(
        children: [
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios),
            title: const Text('First Generation'),
            leading: _buildPokemonImages(context,
                Image.asset(ImageUtilsSelection[ImageUtils.POKEDEX]!),
                Image.asset(ImageUtilsSelection[ImageUtils.POKEDEX]!),
                Image.asset(ImageUtilsSelection[ImageUtils.POKEDEX]!)
            ),
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios),
            title: const Text('Second Generation'),
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios),
            title: const Text('Third Generation'),
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios),
            title: const Text('Fourth Generation'),
          )
        ],
      ),
    );
  }

  Widget _buildPokemonImages(
      BuildContext context, Image pokemon1, Image pokemon2, Image pokemon3) {

    return Container(

    );
  }
}
