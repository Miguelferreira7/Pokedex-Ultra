import 'package:flutter/material.dart';

final Color defaultBackgroundColor = const Color.fromRGBO(0, 18, 37, 1);
final Color defaultAppBarBackgroundColor = const Color.fromRGBO(0, 18, 37, 1);
final Color defaultSecundaryColor = const Color.fromRGBO(8, 51, 88, 1);
final Color defaultContrastColor = Color.fromRGBO(255,215,23,1);

class MyTheme {
  static final darkTheme = new ThemeData(
    scaffoldBackgroundColor: defaultBackgroundColor,
    splashColor: defaultSecundaryColor,
    textTheme: _textThemes(),
    inputDecorationTheme: _inputDecorationTheme(),
    appBarTheme: _appBarTheme(),
    colorScheme: _colorSchemes(),
  );
}

TextTheme _textThemes() {
  return new TextTheme(
    button: new TextStyle(fontSize: 18, color: Colors.black),
    headline1: new TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
    bodyText1: new TextStyle(color: Colors.white),
    subtitle2: new TextStyle(color: Colors.white),
    subtitle1: new TextStyle(color: defaultContrastColor, fontSize: 16, fontWeight: FontWeight.w600),
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
      labelStyle: TextStyle(
        fontSize: 16,
        color: Colors.white,
        ));
}

AppBarTheme _appBarTheme() {
  return new AppBarTheme(
      centerTitle: true,
      titleTextStyle: new TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w400),
      backgroundColor: defaultAppBarBackgroundColor,
      elevation: 0,
      iconTheme: new IconThemeData(color: defaultContrastColor),
      actionsIconTheme: new IconThemeData(color: defaultContrastColor));
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
