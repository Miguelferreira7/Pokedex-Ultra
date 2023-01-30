import 'package:isar/isar.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/dataBase/i_isar.dart';
import 'package:pokedex_ultra/utils/generation_utils.dart';


class IsarRepository implements IIsarRepository{
  late Future<Isar?> db;

  IsarRepository() {
    db = createDB();
  }

  @override
  Future<Isar?> createDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          PokemonEntitySchema,
        ],
        inspector: true,
      );
    }
    return await Isar.getInstance();
  }

  @override
  Future<void> savePokemons(List<PokemonEntity> pokemon) async {
    final isar = await db;
    isar?.writeTxnSync<List<int>>(() => isar.pokemonEntitys.putAllSync(pokemon));
  }

  @override
  Future<List<PokemonEntity>?> getAllPokemons(Generation generation) async {
    final isar = await db;

    try {
      final pokemons = await isar?.pokemonEntitys
          .filter()
          .generationEqualTo(GenerationUtilsSelection[generation]).findAll();

      return pokemons;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> clearDB() async {
    final isar = await db;
    await isar?.writeTxn(() => isar.clear());
  }
}
