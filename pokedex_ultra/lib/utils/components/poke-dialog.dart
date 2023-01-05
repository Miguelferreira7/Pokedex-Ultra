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
        titleTextStyle: _theme.textTheme.headline1,
        contentTextStyle: _theme.textTheme.subtitle1,
        contentPadding: const EdgeInsets.only(bottom: 8, top: 16, left: 16, right: 16),
        alignment: Alignment.centerRight,
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Center(
            child: Text(title, textAlign: TextAlign.center)
        ),
        content: Text(message, textAlign: TextAlign.center),
        actions: [
          Column(
            children: [
              const Divider(color: Colors.grey),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "OK",
                      style: _theme.textTheme.headline1?.copyWith(fontSize: 16),
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
