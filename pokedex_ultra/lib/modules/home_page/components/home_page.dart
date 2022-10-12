import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String ROUTE = "/home-page";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("DEU BOM!"),
      ),
    );
  }
}
