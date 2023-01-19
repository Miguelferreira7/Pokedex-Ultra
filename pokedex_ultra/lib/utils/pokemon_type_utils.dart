import 'package:flutter/material.dart';

enum TypeUtils {
  NORMAL,
  FIGHTING,
  FLYING,
  POISON,
  GROUND,
  FIRE,
  WATER,
  GRASS,
  ROCK,
  BUG,
  GHOST,
  STEEL,
  PSYCHIC,
  ELETRIC,
  ICE,
  DRAGON,
  DARK,
  FAIRY,
  UNKNOWN,
  SHADOW;

  Color get typeColor {
    switch (this) {
      case TypeUtils.NORMAL:
        return Color(0xFFA8A77A);

      case TypeUtils.FIGHTING:
        return Color(0xFFC22E28);

      case TypeUtils.FLYING:
        return Color(0xFFA98FF3);

      case TypeUtils.POISON:
        return Color(0xFFA33EA1);

      case TypeUtils.GROUND:
        return Color(0xFFE2BF65);

      case TypeUtils.FIRE:
        return Color(0xFFEE8130);

      case TypeUtils.WATER:
        return Color(0xFF6390F0);

      case TypeUtils.GRASS:
        return Color(0xFF7AC74C);

      case TypeUtils.ROCK:
        return Color(0xFFB6A136);

      case TypeUtils.BUG:
        return Color(0xFFB6A136);

      case TypeUtils.GHOST:
        return Color(0xFF735797);

      case TypeUtils.STEEL:
        return Color(0xFFB7B7CE);

      case TypeUtils.PSYCHIC:
        return Color(0xFFF95587);

      case TypeUtils.ELETRIC:
        return Color(0xFFF7D02C);

      case TypeUtils.ICE:
        return Color(0xFF96D9D6);

      case TypeUtils.DRAGON:
        return Color(0xFF6F35FC);

      case TypeUtils.DARK:
        return Color(0xFF705746);

      case TypeUtils.FAIRY:
        return Color(0xFFD685AD);

      case TypeUtils.UNKNOWN:
        return Color(0xFFA8A77A);

      case TypeUtils.SHADOW:
        return Color(0xFFA8A77A);
    }
  }
}

const Map<TypeUtils, String> TypeUtilsSelection = {
  TypeUtils.NORMAL: "normal",
  TypeUtils.FIGHTING: "fighting",
  TypeUtils.FLYING: "flying",
  TypeUtils.POISON: "poison",
  TypeUtils.GROUND: "ground",
  TypeUtils.ELETRIC: "electric",
  TypeUtils.FIRE: "fire",
  TypeUtils.WATER: "water",
  TypeUtils.GRASS: "grass",
  TypeUtils.ROCK: "rock",
  TypeUtils.BUG: "bug",
  TypeUtils.GHOST: "ghost",
  TypeUtils.STEEL: "steel",
  TypeUtils.PSYCHIC: "psychic",
  TypeUtils.ICE: "ice",
  TypeUtils.DRAGON: "dragon",
  TypeUtils.DARK: "dragon",
  TypeUtils.FAIRY: "fairy",
  TypeUtils.UNKNOWN: "unknown",
  TypeUtils.SHADOW: "shadow"
};

Color validateColorType(String? type) {
  if (TypeUtilsSelection[TypeUtils.NORMAL] == type) {
    return Color(0xFFA8A77A);
  }

  if (TypeUtilsSelection[TypeUtils.ELETRIC] == type) {
    return Colors.yellow;
  }

  if (TypeUtilsSelection[TypeUtils.FIGHTING] == type) {
    return Color(0xFFC22E28);
  }

  if (TypeUtilsSelection[TypeUtils.FLYING] == type) {
    return Color(0xFFA98FF3);
  }

  if (TypeUtilsSelection[TypeUtils.POISON] == type) {
    return Color(0xFFA33EA1);
  }

  if (TypeUtilsSelection[TypeUtils.GROUND] == type) {
    return Color(0xFFE2BF65);
  }

  if (TypeUtilsSelection[TypeUtils.FIRE] == type) {
    return Color(0xFFEE8130);
  }

  if (TypeUtilsSelection[TypeUtils.WATER] == type) {
    return Color(0xFF6390F0);
  }

  if (TypeUtilsSelection[TypeUtils.GRASS] == type) {
    return Color(0xFF7AC74C);
  }

  if (TypeUtilsSelection[TypeUtils.ROCK] == type) {
    return Color(0xFFB6A136);
  }

  if (TypeUtilsSelection[TypeUtils.BUG] == type) {
    return Color(0xFFB6A136);
  }

  if (TypeUtilsSelection[TypeUtils.GHOST] == type) {
    return Color(0xFF735797);
  }

  if (TypeUtilsSelection[TypeUtils.STEEL] == type) {
    return Color(0xFFB7B7CE);
  }

  if (TypeUtilsSelection[TypeUtils.PSYCHIC] == type) {
    return Color(0xFFF95587);
  }

  if (TypeUtilsSelection[TypeUtils.PSYCHIC] == type) {
    return Color(0xFFF7D02C);
  }

  if (TypeUtilsSelection[TypeUtils.ICE] == type) {
    return Color(0xFF96D9D6);
  }
  if (TypeUtilsSelection[TypeUtils.DRAGON] == type) {
    return Color(0xFF6F35FC);
  }

  if (TypeUtilsSelection[TypeUtils.DARK] == type) {
    return Color(0xFF705746);
  }

  if (TypeUtilsSelection[TypeUtils.FAIRY] == type) {
    return Color(0xFFD685AD);
  }

  if (TypeUtilsSelection[TypeUtils.UNKNOWN] == type) {
    return Color(0xFFA8A77A);
  }

  if (TypeUtilsSelection[TypeUtils.SHADOW] == type) {
    return Color(0xFFA8A77A);
  }
  return Color(0xFFA8A77A);
}
