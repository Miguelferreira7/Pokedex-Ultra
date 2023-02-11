import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_ultra/utils/enums/image_utils.dart';

import '../../login/pages/sign_in_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Container(
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
                          Image.asset(
                            ImageUtilsSelection[ImageUtils.LOGO_WITH_NAME]!,
                            scale: 1.8,
                          )
                        ],
                      ),
                    ),
                  ),
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
                alignment: Alignment.bottomRight,
                child: Text("Sign Out",
                    style: Theme.of(context).textTheme.button?.copyWith(
                        color: const Color.fromRGBO(243, 241, 237, 1))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
