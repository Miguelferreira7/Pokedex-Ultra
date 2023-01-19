import 'package:isar/isar.dart';

import '../utils/generation_utils.dart';
import 'entity/pokemon_entity.dart';

abstract class IIsarRepository {

  Future<Isar?> createDB() async {}

  Future<void> savePokemons(List<PokemonEntity> pokemon) async {}

  Future<List<PokemonEntity>?> getAllPokemons(Generation generation) async {}

  Future<void> clearDB() async {}
  }