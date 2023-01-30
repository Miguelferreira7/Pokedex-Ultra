import 'package:isar/isar.dart';
import 'package:pokedex_ultra/dataBase/entity/moves_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/stats_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/types_entity.dart';

part 'pokemon_entity.g.dart';

@collection
class PokemonEntity {
  Id id = Isar.autoIncrement;

  int? generation;
  int? number;
  String? name;
  int? baseExperience;
  int? height;
  int? weight;
  bool? isDefault;
  bool? isFavorite;
  int? order;
  String? urlSprite;

  // final moves = IsarLinks<MovesEntity>();
  // final types = IsarLinks<TypesEntity>();
  // final stats = IsarLinks<StatsEntity>();
  List<MovesEntity>? moves;
  List<TypesEntity>? types;
  List<StatsEntity>? stats;
}