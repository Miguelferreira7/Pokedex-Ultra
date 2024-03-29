import 'package:pokeapi/model/pokemon/pokemon-specie.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokedex_ultra/api/pokemon_service.dart';
import 'package:pokedex_ultra/dataBase/entity/description_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/moves_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/pokemon_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/stats_entity.dart';
import 'package:pokedex_ultra/dataBase/entity/types_entity.dart';
import 'package:pokedex_ultra/dataBase/isar.dart';
import 'package:pokedex_ultra/modules/pokedex/model/pokemon_species_viewmodel.dart';
import 'package:pokedex_ultra/utils/enums/generation_utils.dart';

class AppSettings {
  PokemonService service = new PokemonService();
  IsarRepository isar = new IsarRepository();

  List<Pokemon?> _firstGeneration = [];
  List<Pokemon?> _secondGeneration = [];
  List<Pokemon?> _thirdGeneration = [];
  List<Pokemon?> _fourthGeneration = [];

  Future<void> InitAppConfiguration() async {
    await _getPokemonsApi();

    List<PokemonEntity> filteredFirstGeneration = await _createPokemonEntity(_firstGeneration, 1);
    List<PokemonEntity> filteredSecondGeneration = await _createPokemonEntity(_secondGeneration, 2);
    List<PokemonEntity> filteredThirdGeneration = await _createPokemonEntity(_thirdGeneration, 3);
    List<PokemonEntity> filteredFourthGeneration = await _createPokemonEntity(_fourthGeneration, 4);

    List<PokemonEntity> finalPokemonList =
        filteredFirstGeneration + filteredSecondGeneration +
        filteredThirdGeneration + filteredFourthGeneration;

    _savePokemons(finalPokemonList);
  }

  Future<List<PokemonEntity>> searchPokemonsByGeneration(Generation generationSelected) async {
    List<Pokemon?> listApiPokemons = [];
    List<PokemonEntity> filteredPokemonList = [];


    switch (generationSelected) {

      case Generation.FIRST_GENERATION:
        listApiPokemons = await PokeAPI.getObjectList<Pokemon>(1, 151);
        filteredPokemonList = await _createPokemonEntity(listApiPokemons, 1);
        break;

      case Generation.SECOND_GENERATION:
        listApiPokemons = await PokeAPI.getObjectList<Pokemon>(152, 251);
        filteredPokemonList = await _createPokemonEntity(listApiPokemons, 2);
        break;

      case Generation.THIRD_GENERATION:
        listApiPokemons = await PokeAPI.getObjectList<Pokemon>(252, 386);
        filteredPokemonList = await _createPokemonEntity(listApiPokemons, 3);
        break;

      case Generation.FOURTH_GENERATION:
        listApiPokemons = await PokeAPI.getObjectList<Pokemon>(387, 493);
        filteredPokemonList = await _createPokemonEntity(listApiPokemons, 4);
        break;
    }

    await _savePokemons(filteredPokemonList);
    return filteredPokemonList;
  }

  Future<void> _getPokemonsApi() async {
    _firstGeneration = await PokeAPI.getObjectList<Pokemon>(1, 151);
    _secondGeneration = await PokeAPI.getObjectList<Pokemon>(152, 251);
    _thirdGeneration = await PokeAPI.getObjectList<Pokemon>(252, 386);
    _fourthGeneration = await PokeAPI.getObjectList<Pokemon>(387, 493);
  }

  Future<void> InitDb(Generation generationSelected) async {
    await isar.createDB();
  }

    Future<List<PokemonEntity>> _createPokemonEntity(List<Pokemon?> pokemons, int generation) async {
      List<PokemonEntity> pokemonEntities = [];


      for (int i = 0; i < pokemons.length; i++) {
        PokemonSpeciesViewModel pokemonSpecies = await service.getPokemonDescription(pokemons[i]!.species!.url!);

        List<TypesEntity> typesEntity = await _createTypesEntity(pokemons[i]?.types);
        List<MovesEntity> movesEntity = await _createMovesEntity(pokemons[i]?.moves);
        List<StatsEntity> statsEntity = await _createStatsEntity(pokemons[i]?.stats);
        List<DescriptionEntity> descriptionEntity = await _getPokemonDescription(pokemonSpecies);

        pokemonEntities.add(new PokemonEntity()
          ..stats = statsEntity
          ..moves = movesEntity
          ..types = typesEntity
          ..description = descriptionEntity
          ..evolutionChain = null
          ..generation = generation
          ..imagePokemon = 0
          ..isFavorite = false
          ..isLegendary = pokemonSpecies.isLegendary != null ? pokemonSpecies.isLegendary : false
          ..number = pokemons[i]?.id
          ..name = pokemons[i]?.name
          ..order = pokemons[i]?.order
          ..height = pokemons[i]?.height
          ..weight = pokemons[i]?.weight
          ..isDefault = pokemons[i]?.isDefault
          ..baseExperience = pokemons[i]?.baseExperience
          ..urlSprite = pokemons[i]?.sprites?.frontDefault
        );
      }
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

  Future<List<DescriptionEntity>> _getPokemonDescription(PokemonSpeciesViewModel? pokemonSpecies) async {
    List<DescriptionEntity> descriptionsList = [];

    if (pokemonSpecies != null && pokemonSpecies.flavorTextEntries != null && pokemonSpecies!.flavorTextEntries!.isNotEmpty) {
      for (int i = 0; i < pokemonSpecies.flavorTextEntries!.length; i++) {
        if (pokemonSpecies.flavorTextEntries![i].language!.name == 'en'
            && pokemonSpecies.flavorTextEntries![i].version!.name == "omega-ruby") {
          descriptionsList.add(new DescriptionEntity()
              ..descriptionText = pokemonSpecies.flavorTextEntries![i].flavorText
              ..language = pokemonSpecies.flavorTextEntries![i].language!.name
          );
        }
      }
    }

    return descriptionsList;
  }

  Future<void> _savePokemons(List<PokemonEntity> pokemons) async {
    await isar.savePokemons(pokemons);
  }
}