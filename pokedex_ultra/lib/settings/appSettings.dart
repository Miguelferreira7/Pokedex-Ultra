import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex_ultra/dataBase/entity/moves_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/stats_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/types_entity.dart';
import 'package:pokedex_ultra/dataBase/isar.dart';

class AppSettings {
  IsarRepository isar = new IsarRepository();
  List<Pokemon?> firstGeneration = [];
  List<Pokemon?> secondGeneration = [];
  List<Pokemon?> thirdGeneration = [];
  List<Pokemon?> fourthGeneration = [];

  Future<void> InitAppConfiguration() async {
    await isar.createDB();

    await _getPokemonsApi();
    List<PokemonEntity> filteredFirstGeneration = await _createPokemonEntity(firstGeneration, 1);
    List<PokemonEntity> filteredSecondGeneration = await _createPokemonEntity(secondGeneration, 2);
    List<PokemonEntity> filteredThirdGeneration = await _createPokemonEntity(thirdGeneration, 3);
    List<PokemonEntity> filteredFourthGeneration = await _createPokemonEntity(fourthGeneration, 4);

    List<PokemonEntity> finalPokemonList =
        filteredFirstGeneration + filteredSecondGeneration +
        filteredThirdGeneration + filteredFourthGeneration;

    _savePokemons(finalPokemonList);
  }

  Future<void> _getPokemonsApi() async {
    firstGeneration = await PokeAPI.getObjectList<Pokemon>(1, 151);
    secondGeneration = await PokeAPI.getObjectList<Pokemon>(152, 251);
    thirdGeneration = await PokeAPI.getObjectList<Pokemon>(252, 386);
    fourthGeneration = await PokeAPI.getObjectList<Pokemon>(387, 493);
  }

  Future<List<PokemonEntity>> _createPokemonEntity(List<Pokemon?> pokemons, int generation) async {
      List<PokemonEntity> pokemonEntities = [];

      pokemons.forEach((element) async {

        List<TypesEntity> typesEntity = await _createTypesEntity(element?.types);
        List<MovesEntity> movesEntity = await _createMovesEntity(element?.moves);
        List<StatsEntity> statsEntity = await _createStatsEntity(element?.stats);

        pokemonEntities.add(new PokemonEntity()
          ..stats = statsEntity
          ..moves = movesEntity
          ..types = typesEntity
          ..generation = generation
          ..number = element?.id
          ..name = element?.name
          ..order = element?.order
          ..height = element?.height
          ..weight = element?.weight
          ..isDefault = element?.isDefault
          ..baseExperience = element?.baseExperience
          ..urlSprite = element?.sprites?.frontDefault
        );
      });
      return pokemonEntities;
  }

  List<TypesEntity> _createTypesEntity(List<Types>? types) {
    if (types != null && types.isNotEmpty) {
      List<TypesEntity> typesEntity = [];

      types.forEach((element) {
        typesEntity.add(
          new TypesEntity()
            ..category = element.type?.category
            ..type = element.type?.name
        );
      });
      return typesEntity;
    }
    return [];
  }

  List<MovesEntity> _createMovesEntity(List<Moves>? moves) {
    if (moves != null && moves.isNotEmpty) {
      List<MovesEntity> movesEntity = [];

      moves.forEach((element) {
        movesEntity.add(
            new MovesEntity()
              ..name = element.move?.name
              ..category = element.move?.category
              ..urlDetails = element.move?.url
        );
      });
      return movesEntity;
    }
    return [];
  }

  List<StatsEntity> _createStatsEntity(List<Stats>? stats) {
    if (stats != null && stats.isNotEmpty) {
      List<StatsEntity> statsEntity = [];

      stats.forEach((element) {
        statsEntity.add(
            new StatsEntity()
              ..name = element.stat?.name
              ..category = element.stat?.category
              ..urlDetails = element.stat?.url
              ..baseStat = element.baseStat
        );
      });
      return statsEntity;
    }
    return [];
  }

  void _savePokemons(List<PokemonEntity> pokemons) {
    isar.savePokemons(
      pokemons
    );
  }
}