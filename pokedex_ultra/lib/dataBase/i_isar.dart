import 'package:isar/isar.dart';

import '../utils/generation_utils.dart';
import 'entity/pokemon_entity.dart';

abstract class IIsarRepository {

  Future<Isar?> createDB();

  Future<void> savePokemons(List<PokemonEntity> pokemon);

  Future<List<PokemonEntity>?> getAllPokemons(Generation generation);

  Future<void> updatePokemonFavoriteStatus(PokemonEntity Pokemon);

  Future<void> removePokemonfromPersonalPokedex(PokemonEntity idPokemon);

  Future<void> clearDB() async {}
  }