import 'package:flutter/material.dart';

final Color darkDefaultBackgroundColor = const Color.fromRGBO(0, 18, 37, 1);
final Color darkDefaultAppBarBackgroundColor = const Color.fromRGBO(0, 18, 37, 1);
final Color darkDefaultSecundaryColor = const Color.fromRGBO(8, 51, 88, 1);
final Color darkDefaultContrastColor = const Color.fromRGBO(255,215,23,1);

class MainTheme {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkDefaultBackgroundColor,
    splashColor: darkDefaultSecundaryColor,
    textTheme: _darkTextThemes(),
    inputDecorationTheme: _darkInputDecorationTheme(),
    appBarTheme: _darkAppBarTheme(),
    colorScheme: _darkColorSchemes(),
    drawerTheme: _darkDrawerTheme(),
    errorColor: Colors.white
  );

  static _darkColorSchemes() {
    return ColorScheme.dark(
      primary: darkDefaultSecundaryColor,
      secondary: darkDefaultSecundaryColor,
      tertiary: darkDefaultContrastColor,
      background: darkDefaultBackgroundColor,
      error: darkDefaultContrastColor,
      onBackground: darkDefaultBackgroundColor,
    );
  }

  static _darkTextThemes() {
    return TextTheme(
      button: const TextStyle(fontSize: 18, color: Colors.black),
      headline1: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
      bodyText1: const TextStyle(color: Colors.white),
      subtitle2: const TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: darkDefaultContrastColor, fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  static _darkInputDecorationTheme() {
    return InputDecorationTheme(
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

  static _darkDrawerTheme() {
    return DrawerThemeData(
      elevation: 0,
      backgroundColor: darkDefaultBackgroundColor,
    );
  }

  static _darkAppBarTheme() {
    return AppBarTheme(
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w400),
        backgroundColor: darkDefaultAppBarBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: darkDefaultContrastColor),
        actionsIconTheme: IconThemeData(color: darkDefaultContrastColor));
  }
}