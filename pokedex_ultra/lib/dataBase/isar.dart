import 'package:isar/isar.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';


class IsarRepository {
  late Future<Isar?> db;

  IsarRepository() {
    db = createDB();
  }

  Future<void> savePokemons(List<PokemonEntity> pokemon) async {
    final isar = await db;
    isar?.writeTxnSync<List<int>>(() => isar.pokemonEntitys.putAllSync(pokemon));
  }

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
}
