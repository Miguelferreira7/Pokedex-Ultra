import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/utils/image_utils.dart';
import 'package:pokedex_ultra/utils/news_utils.dart';
import 'package:pokedex_ultra/utils/pokedex_selection_enum.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../login/pages/sign_in_screen.dart';
import '../../pokedex/bloc/pokedex_cubit.dart';
import '../bloc/home_page_cubit.dart';
import '../bloc/home_page_cubit_model.dart';
import 'generations_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static final String ROUTE = "/home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return BlocBuilder<HomePageCubit, HomePageCubitModel>(
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
                              style: const TextStyle(
                                  color: Color.fromRGBO(243, 241, 237, 1))),
                        ),
                      ),
                      const Divider(color: Color.fromRGBO(243, 241, 237, 1)),
                      ListTile(
                        style: ListTileStyle.drawer,
                        leading: const Icon(Icons.settings),
                        title: GestureDetector(
                          child: Text("Settings",
                              style: const TextStyle(
                                  color: Color.fromRGBO(243, 241, 237, 1))),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        SignInScreen.ROUTE, (route) => false);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 16),
                    alignment: Alignment.centerRight,
                    child: Text("Sign Out",
                        style: Theme.of(context).textTheme.button?.copyWith(
                            color: const Color.fromRGBO(243, 241, 237, 1))),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomePageCubitModel state) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildWelcomeMessage(context),
              _buildMenuContainer(context),
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

  Widget _buildMenuContainer(BuildContext context) {
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
                onTap: () => _buildSelectionPokedexModal(context),
                child: _buildCardMenuOption(context, pokedexTitle, Colors.red,
                    Image.asset(ImageUtilsSelection[ImageUtils.POKEDEX]!)),
              ),
              GestureDetector(
                child: _buildCardMenuOption(
                  context,
                  teamsTitle,
                  theme.colorScheme.primary,
                  Image.asset(
                    ImageUtilsSelection[ImageUtils.LUCARIO]!,
                    color: Colors.blueAccent.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: _buildCardMenuOption(
                  context,
                  habilitiesTitle,
                  theme.colorScheme.tertiary,
                  Image.asset(ImageUtilsSelection[ImageUtils.THUNDER]!),
                ),
              ),
              GestureDetector(
                child: _buildCardMenuOption(
                  context,
                  itemsTitle,
                  Colors.white30,
                  Image.asset(ImageUtilsSelection[ImageUtils.ULTRABALL]!),
                ),
                onTap: () async {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardMenuOption(BuildContext context, String optionName,
      Color colorOption, Image imageAsset) {
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
            child: Text(optionName,
                style: const TextStyle(fontWeight: FontWeight.w500)),
            decoration: BoxDecoration(
                color: colorOption, borderRadius: BorderRadius.circular(10)),
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
                              .setPokedexOrFavoritesSelected(
                            PokedexSelectionEnum.ALL_POKEMONS,
                          );
                          _buildGenerationsModal(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("All Pokémons",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        key: keyTutorial3,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text("Your Pokédex",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
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
        });
  }

  Future<void> _buildGenerationsModal(context) {
    return showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new GenerationsModal();
        });
  }

  Widget _buildNews(BuildContext context, HomePageCubitModel state) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child:
              Text("Articles:", style: Theme.of(context).textTheme.headline1),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () =>
                      _openUrlArticle(NewsUtils.urlWebSiteAshWinsLeagueNews),
                  child: Container(
                    margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                            "${NewsUtils.urlImageAshWinsLeagueNews}",
                            fit: BoxFit.fill),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.14, 0.6],
                            colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.4),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.only(left: 16, bottom: 16),
                        child: Text(
                          "Ash Ketchum has finally won the Pokemon "
                          "League after 25 years",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 20),
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  padding: const EdgeInsets.only(left: 8),
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: MediaQuery.of(context).size.height * 0.24,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("On demand...",
                      style: Theme.of(context).textTheme.button),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _openUrlArticle(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      launchUrl(_url, mode: LaunchMode.externalNonBrowserApplication);
    }
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
