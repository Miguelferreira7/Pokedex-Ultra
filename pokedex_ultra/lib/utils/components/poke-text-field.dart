import 'package:flutter/material.dart';

class PokeTextField extends StatefulWidget {

  String hint;
  TextEditingController controller;
  String title;
  TextInputType keyboardType;
  FocusNode focusNode;
  bool isPassword;
  bool hidePassword = true;

  PokeTextField({
    required this.hint,
    required this.controller,
    required this.title,
    required this.focusNode,
    required this.keyboardType,
    required this.isPassword
  });

  @override
  State<PokeTextField> createState() => _PokeTextFieldState();
}

class _PokeTextFieldState extends State<PokeTextField> {
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
            child: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    obscureText: !widget.hidePassword,
                    focusNode: widget.focusNode,
                    controller: widget.controller,
                    keyboardType: widget.keyboardType,
                    decoration: InputDecoration(
                      hintText: widget.title,
                    ),
                    style: TextStyle(
                      color: Theme.of(context).errorColor
                    ),
                  ),
                ),
                _buildShowPasswordButton(),
              ],
            ),
            padding: const EdgeInsets.only(top: 4),
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

  Widget _buildShowPasswordButton() {
    if (widget.isPassword) {
     return Container(
       padding: const EdgeInsets.only(right: 4),
      child: IconButton(
        icon: Icon(
          _buildPasswordIcon(),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        onPressed: () {
          setState(() {
            widget.hidePassword = !widget.hidePassword;
          });
        },
      ),
    );
    } else {
      return Container();
    }
  }

  IconData? _buildPasswordIcon() {
    if (!widget.hidePassword) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }
}
