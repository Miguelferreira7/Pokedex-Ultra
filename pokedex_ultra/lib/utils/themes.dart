import 'package:flutter/material.dart';

final Color defaultBackgroundColor = const Color.fromRGBO(0, 18, 37, 1);
final Color defaultAppBarBackgroundColor = const Color.fromRGBO(0, 18, 37, 1);
final Color defaultSecundaryColor = const Color.fromRGBO(8, 51, 88, 1);
final Color defaultContrastColor = Color.fromRGBO(255,215,23,1);

class MainTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: defaultBackgroundColor,
    splashColor: defaultSecundaryColor,
    textTheme: _textThemes(),
    inputDecorationTheme: _inputDecorationTheme(),
    appBarTheme: _appBarTheme(),
    colorScheme: _colorSchemes(),
    errorColor: Colors.white
  );
}

TextTheme _textThemes() {
  return TextTheme(
    button: const TextStyle(fontSize: 18, color: Colors.black),
    headline1: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
    bodyText1: const TextStyle(color: Colors.white),
    subtitle2: const TextStyle(color: Colors.white),
    subtitle1: TextStyle(color: defaultContrastColor, fontSize: 16, fontWeight: FontWeight.w600),
  );
}

InputDecorationTheme _inputDecorationTheme() {
  return new InputDecorationTheme(
      contentPadding: const EdgeInsets.only(left: 8),
      hoverColor: Colors.yellow,
      focusColor: Colors.yellow,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        ));
}

AppBarTheme _appBarTheme() {
  return new AppBarTheme(
      centerTitle: true,
      titleTextStyle: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w400),
      backgroundColor: defaultAppBarBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: defaultContrastColor),
      actionsIconTheme: IconThemeData(color: defaultContrastColor));
}



ColorScheme _colorSchemes() {
  return new ColorScheme.dark(
    primary: defaultSecundaryColor,
    secondary: defaultContrastColor,
    background: defaultBackgroundColor,
    error: defaultContrastColor,
    onBackground: defaultBackgroundColor,
  );
}
