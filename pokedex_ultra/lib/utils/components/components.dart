import 'package:flutter/material.dart';

class PokeTextField extends StatelessWidget {

  ThemeData theme;
  String label;
  TextEditingController controller;
  String title;
  TextInputType keyboardType;
  FocusNode focusNode;
  ValueChanged<String> onChange;

  PokeTextField({
    required this.theme,
    required this.label,
    required this.controller,
    required this.title,
    required this.focusNode,
    required this.keyboardType,
    required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 4, bottom: 4),
            child: Text(title),
          ),
          Container(
            padding: const EdgeInsets.only(top: 4),
            child: TextField(
              focusNode: focusNode,
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChange,
              decoration: InputDecoration(
                hintText: label,
              ),
            ),
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: new BoxDecoration(
                color: theme.splashColor,
                border: new Border.all(width: 1),
                borderRadius:
                const BorderRadius.all(const Radius.circular(10)))
          ),
        ],
      ),
    );
  }
}
