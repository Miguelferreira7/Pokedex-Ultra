import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String ROUTE = "/home-page";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: Drawer(
          elevation: 0,
          backgroundColor: theme.backgroundColor.withOpacity(0),
          child: Icon(Icons.menu),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildWelcomeMessage(context),
            _buildMenuOptions(context),
            _buildNews()
          ],
        ),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height * 0.10,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("POKÉDEX"),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/pokedex.png'),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.4,
                height: MediaQuery.of(context).size.height * 0.10,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("POKÉDEX"),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/Lucario.png', scale: 4,),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNews() {
    return Container();
  }
}
