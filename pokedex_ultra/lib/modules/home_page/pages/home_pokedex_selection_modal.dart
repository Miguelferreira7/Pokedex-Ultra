import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/utils/enums/image_utils.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../../utils/enums/pokedex_selection_enum.dart';
import '../../pokedex/bloc/pokedex_cubit.dart';
import 'home_generations_modal.dart';

class HomePokedexSelectionModal extends StatefulWidget {
  HomePokedexSelectionModal({Key? key}) : super(key: key);

  @override
  State<HomePokedexSelectionModal> createState() => _HomePokedexSelectionModalState();
}

class _HomePokedexSelectionModalState extends State<HomePokedexSelectionModal> {
  List<TargetFocus> targets = [];

  TutorialCoachMark? tutorialCoachMark;

  final keyTutorial1 = new GlobalKey();

  final keyTutorial2 = new GlobalKey();

  final keyTutorial3 = new GlobalKey();

  final onTap = new GlobalKey();

  @override
  void initState() {
    _initTarget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.black.withOpacity(0.4),
      content: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  _showTutorial(context);
                },
                icon: Icon(Icons.help_outline_rounded),
              ),
            ),
            Row(
              key: keyTutorial1,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  key: keyTutorial2,
                  onTap: () {
                    Navigator.of(context).pop();
                    BlocProvider.of<PokedexCubit>(context)
                        .updatePokedexOrFavoritesSelected(
                      PokedexSelectionEnum.ALL_POKEMONS,
                    );
                    _buildGenerationsModal(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text("All Pokémons",
                              style: Theme.of(context).textTheme.subtitle1),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    BlocProvider.of<PokedexCubit>(context)
                        .updatePokedexOrFavoritesSelected(
                      PokedexSelectionEnum.FAVORITES_POKEMONS,
                    );
                    _buildGenerationsModal(context);
                  },
                  key: keyTutorial3,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            scale: 4,
                            image: AssetImage(
                                ImageUtilsSelection[ImageUtils.POKEDEX]!))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text("Your Pokédex",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 16)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buildGenerationsModal(context) {
    return showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new HomeGenerationsModal();
        });
  }

  void _showTutorial(BuildContext context) {
    tutorialCoachMark = new TutorialCoachMark(
      pulseAnimationDuration: const Duration(milliseconds: 800),
      focusAnimationDuration: const Duration(milliseconds: 500),
      targets: targets,
      opacityShadow: 0.8,
      alignSkip: Alignment.topRight,
    )..show(context: context);
  }

  void _initTarget() {
    Color backgroundColor = Colors.yellow.withOpacity(0.5);

    targets.add(
      new TargetFocus(
        identify: "Target 1",
        keyTarget: keyTutorial2,
        enableTargetTab: true,
        enableOverlayTab: true,
        color: backgroundColor,
        focusAnimationDuration: Duration(seconds: 1),
        contents: [
          new TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "ALL POKEMONS",
                      style: new TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  new Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: new Text(
                      "In all Pokemon's"
                      " you can see the complete pokédex from each generation.",
                      style: new TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new GestureDetector(
                    child: new Container(
                      padding: EdgeInsets.only(top: 16),
                      child: new Text(
                        "TOUCH ON THE SCREEN TO PROCEED",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () {
                      onTap;
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      new TargetFocus(
        identify: "Target 2",
        keyTarget: keyTutorial3,
        color: backgroundColor,
        enableTargetTab: true,
        enableOverlayTab: true,
        focusAnimationDuration: Duration(seconds: 1),
        contents: [
          new TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: new Text(
                      "YOUR POKÉDEX",
                      style: new TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  new Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: new Text(
                      "This is your pokédex, "
                      "where you can add the Pokemon by marking as favorites"
                      " on the all Pokemon's screen",
                      style: new TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                  ),
                  new GestureDetector(
                    child: new Container(
                      padding: EdgeInsets.only(top: 16),
                      child: new Text(
                        "TOUCH ON THE SCREEN TO PROCEED",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: () {
                      onTap;
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
