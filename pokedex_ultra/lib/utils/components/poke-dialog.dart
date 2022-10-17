import 'package:flutter/material.dart';

class PokeDialog extends StatelessWidget {

  String title;
  String message;

  PokeDialog({
    required this.title,
    required this.message,
    });

  @override
  Widget build(BuildContext context) {

    ThemeData _theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(left: 8, right: 16),
      child: AlertDialog(
        backgroundColor: _theme.colorScheme.secondary,
        titleTextStyle: _theme.textTheme.headline1?.copyWith(color: Colors.black),
        contentTextStyle: _theme.textTheme.subtitle1?.copyWith(color: Colors.black),
        contentPadding: const EdgeInsets.all(16),
        alignment: Alignment.centerRight,
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Center(
            child: Text(title, textAlign: TextAlign.center)
        ),
        content: Text( message, textAlign: TextAlign.center,),
        actions: [
          Column(
            children: [
              Divider(color: _theme.colorScheme.background),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "OK",
                    style: _theme.textTheme.button,
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}
