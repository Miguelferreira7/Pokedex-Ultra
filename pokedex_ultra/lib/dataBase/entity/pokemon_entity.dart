import 'package:isar/isar.dart';
import 'package:pokedex_ultra/dataBase/entity/description_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/evolution_chain_entity.dart';
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
  bool? isLegendary;
  int? order;
  String? urlSprite;
  int? imagePokemon;

  List<DescriptionEntity>? description;
  List<EvolutionChainEntity>? evolutionChain;
  List<MovesEntity>? moves;
  List<TypesEntity>? types;
  List<StatsEntity>? stats;
}