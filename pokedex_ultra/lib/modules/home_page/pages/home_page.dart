import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_ultra/api/pokemon_service.dart';
import 'package:pokedex_ultra/modules/home_page/pages/home_drawer.dart';
import 'package:pokedex_ultra/modules/home_page/pages/home_pokedex_selection_modal.dart';
import 'package:pokedex_ultra/utils/enums/image_utils.dart';
import 'package:pokedex_ultra/utils/enums/news_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../login/pages/sign_in_screen.dart';
import '../bloc/home_page_cubit.dart';
import '../bloc/home_page_cubit_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static final String ROUTE = "/home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageCubitModel>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          drawer: HomeDrawer(),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, HomePageCubitModel state) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
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
            // Center(
            //   child: Image.asset(
            //     ImageUtilsSelection[ImageUtils.LOGO_WITH_NAME]!,
            //     scale: 1.4,
            //   ),
            // ),
            Column(
              children: [
                _buildNews(context, state),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
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
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Image.asset(
            ImageUtilsSelection[ImageUtils.LOGO_WITH_NAME]!,
            scale: 3,
          ),
        )
      ],
    );
  }

  Widget _buildMenuContainer(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final String pokedexTitle = 'POKÉDEX';
    final String teamsTitle = 'YOUR TEAMS';

    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return HomePokedexSelectionModal();
                      });
                },
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
                    color: Colors.blueAccent.withOpacity(0.9),
                  ),
                ),
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

  Widget _buildNews(BuildContext context, HomePageCubitModel state) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16, bottom: 8),
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
}
