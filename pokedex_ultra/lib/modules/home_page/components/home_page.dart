import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/modules/login/components/login.dart';
import 'package:pokedex_ultra/utils/image_utils.dart';

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
          appBar: AppBar(),
          drawer: _buildDrawer(context),
          body: _buildBody(context, state),
        );
      },
    );
  }

  _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.1,
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      DrawerHeader(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Logo
                            ],
                          ),
                        ),
                      ),
                      const Divider(color: Color.fromRGBO(243, 241, 237, 1)),
                      ListTile(
                        style: ListTileStyle.drawer,
                        leading: const Icon(Icons.info_outlined),
                        title: GestureDetector(
                          onTap: () {},
                          child: const Text("About Us",
                              style: const TextStyle(color: Color.fromRGBO(243, 241, 237, 1))
                          ),
                        ),
                      ),
                      const Divider(color: Color.fromRGBO(243, 241, 237, 1)),
                      ListTile(
                        style: ListTileStyle.drawer,
                        leading: const Icon(Icons.settings),
                        title: GestureDetector(
                          child: Text(
                              "Settings",
                              style: const TextStyle(color: Color.fromRGBO(243, 241, 237, 1))
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        SignInScreen.ROUTE, (route) => false
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 16),
                    alignment: Alignment.centerRight,
                    child: Text("Sign Out", style: Theme.of(context).textTheme.button?.copyWith(
                      color: const Color.fromRGBO(243, 241, 237, 1)
                    )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
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
          "Welcome,\n${FirebaseAuth.instance.currentUser?.displayName?.toUpperCase()}!",
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
    final String itemsTitle = 'ITEMS';

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
                onTap: () => _buildSelectionPokedexModal(context),
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
              GestureDetector(
                child: _buildCardOption(
                  context, itemsTitle, Colors.white30,
                  Image.asset(ImageUtilsSelection[ImageUtils.ULTRABALL]!),
                ),
                onTap: () async {

                },
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

  Future<void> _buildSelectionPokedexModal(context) {
    return showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    _buildGenerationsModal(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text("All Pokémons",
                                style: Theme.of(context).textTheme.subtitle1
                          ),
                          )
                        ],
                      ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text("Your Pokédex",
                              style: Theme.of(context).textTheme.subtitle1
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Future<void> _buildGenerationsModal(context) {
    return showModalBottomSheet(context: context, builder: (builder) {
      return new GenerationsModal();
    });
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
