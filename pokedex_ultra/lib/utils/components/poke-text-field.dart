import 'package:flutter/material.dart';

class PokeTextField extends StatelessWidget {

  String hint;
  TextEditingController controller;
  String title;
  TextInputType keyboardType;
  FocusNode focusNode;

  PokeTextField({
    required this.hint,
    required this.controller,
    required this.title,
    required this.focusNode,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: const EdgeInsets.only(top: 4),
            child: TextField(
              focusNode: focusNode,
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: title,
              ),
              style: TextStyle(
                color: Theme.of(context).errorColor
              ),
            ),
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
                border: Border.all(width: 1),
                borderRadius: const BorderRadius.all(const Radius.circular(10)))
          ),
        ],
      ),
    );
  }
}
