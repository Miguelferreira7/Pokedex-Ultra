import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/utils/imageUtils.dart';

import '../bloc/pokemon_bloc.dart';
import '../bloc/pokemon_cubit_model.dart';
import 'generations_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String ROUTE = "/home-page";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonCubitModel>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const Drawer(
              child: const Icon(Icons.menu),
            ),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, PokemonCubitModel state) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildWelcomeMessage(context),
              _buildMenuOptions(context),
            ],
          ),
          Column(
            children: [
              _buildNews(context, state),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildWelcomeMessage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      margin: const EdgeInsets.only(bottom: 16, top: 16),
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Container(
        child: Text(
          "Welcome,\nUser873154",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  Widget _buildMenuOptions(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final String pokedexTitle = 'POKÉDEX';
    final String teamsTitle = 'YOUR TEAMS';
    final String habilitiesTitle = 'ABILITIES';
    final String itensTitle = 'ITENS';

    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: _buildCardOption(
                    context, pokedexTitle, Colors.red,
                    Image.asset(ImageUtilsSelection[ImageUtils.POKEDEX]!)
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(GenerationsPage.ROUTE);
                },
              ),
              GestureDetector(
                child: _buildCardOption(
                  context, teamsTitle, theme.colorScheme.primary,
                  Image.asset(ImageUtilsSelection[ImageUtils.LUCARIO]!),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCardOption(
                context, habilitiesTitle, theme.colorScheme.tertiary,
                Image.asset(ImageUtilsSelection[ImageUtils.THUNDER]!),
              ),
              _buildCardOption(
                context, itensTitle, Colors.white30,
                Image.asset(ImageUtilsSelection[ImageUtils.ULTRABALL]!),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardOption(
      BuildContext context, String optionName, Color colorOption, Image imageAsset) {

    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      height: MediaQuery.of(context).size.height * 0.10,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 16, right: 4),
            padding: const EdgeInsets.only(left: 8),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Text(
                optionName,
                style: const TextStyle(
                    fontWeight: FontWeight.w500
                )
            ),
            decoration: BoxDecoration(
                color: colorOption,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: imageAsset,
          )
        ],
      ),
    );
  }

  Widget _buildNews(BuildContext context, PokemonCubitModel state) {
    Color containerBackgroundColor;

    if (state.darkTheme == true) {
      containerBackgroundColor = Colors.white;
    } else {
      containerBackgroundColor = Colors.blue;
    }

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8),
              width: MediaQuery.of(context).size.width / 1.4,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: containerBackgroundColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text("on demand", style: Theme.of(context).textTheme.button),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8),
              width: MediaQuery.of(context).size.width / 1.4,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                  color: containerBackgroundColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text("on demand", style: Theme.of(context).textTheme.button),
            ),
          ],
        ),
      ),
    );
  }
}
