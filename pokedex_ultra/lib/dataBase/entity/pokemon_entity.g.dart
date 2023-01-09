// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPokemonEntityCollection on Isar {
  IsarCollection<PokemonEntity> get pokemonEntitys => this.collection();
}

const PokemonEntitySchema = CollectionSchema(
  name: r'PokemonEntity',
  id: 6985887121947963534,
  properties: {
    r'baseExperience': PropertySchema(
      id: 0,
      name: r'baseExperience',
      type: IsarType.long,
    ),
    r'generation': PropertySchema(
      id: 1,
      name: r'generation',
      type: IsarType.long,
    ),
    r'height': PropertySchema(
      id: 2,
      name: r'height',
      type: IsarType.long,
    ),
    r'isDefault': PropertySchema(
      id: 3,
      name: r'isDefault',
      type: IsarType.bool,
    ),
    r'moves': PropertySchema(
      id: 4,
      name: r'moves',
      type: IsarType.objectList,
      target: r'MovesEntity',
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'number': PropertySchema(
      id: 6,
      name: r'number',
      type: IsarType.long,
    ),
    r'order': PropertySchema(
      id: 7,
      name: r'order',
      type: IsarType.long,
    ),
    r'stats': PropertySchema(
      id: 8,
      name: r'stats',
      type: IsarType.objectList,
      target: r'StatsEntity',
    ),
    r'types': PropertySchema(
      id: 9,
      name: r'types',
      type: IsarType.objectList,
      target: r'TypesEntity',
    ),
    r'urlSprite': PropertySchema(
      id: 10,
      name: r'urlSprite',
      type: IsarType.string,
    ),
    r'weight': PropertySchema(
      id: 11,
      name: r'weight',
      type: IsarType.long,
    )
  },
  estimateSize: _pokemonEntityEstimateSize,
  serialize: _pokemonEntitySerialize,
  deserialize: _pokemonEntityDeserialize,
  deserializeProp: _pokemonEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'MovesEntity': MovesEntitySchema,
    r'TypesEntity': TypesEntitySchema,
    r'StatsEntity': StatsEntitySchema
  },
  getId: _pokemonEntityGetId,
  getLinks: _pokemonEntityGetLinks,
  attach: _pokemonEntityAttach,
  version: '3.0.5',
);

int _pokemonEntityEstimateSize(
  PokemonEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.moves;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[MovesEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              MovesEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.stats;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[StatsEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              StatsEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.types;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[TypesEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              TypesEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.urlSprite;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pokemonEntitySerialize(
  PokemonEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.baseExperience);
  writer.writeLong(offsets[1], object.generation);
  writer.writeLong(offsets[2], object.height);
  writer.writeBool(offsets[3], object.isDefault);
  writer.writeObjectList<MovesEntity>(
    offsets[4],
    allOffsets,
    MovesEntitySchema.serialize,
    object.moves,
  );
  writer.writeString(offsets[5], object.name);
  writer.writeLong(offsets[6], object.number);
  writer.writeLong(offsets[7], object.order);
  writer.writeObjectList<StatsEntity>(
    offsets[8],
    allOffsets,
    StatsEntitySchema.serialize,
    object.stats,
  );
  writer.writeObjectList<TypesEntity>(
    offsets[9],
    allOffsets,
    TypesEntitySchema.serialize,
    object.types,
  );
  writer.writeString(offsets[10], object.urlSprite);
  writer.writeLong(offsets[11], object.weight);
}

PokemonEntity _pokemonEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokemonEntity();
  object.baseExperience = reader.readLongOrNull(offsets[0]);
  object.generation = reader.readLongOrNull(offsets[1]);
  object.height = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.isDefault = reader.readBoolOrNull(offsets[3]);
  object.moves = reader.readObjectList<MovesEntity>(
    offsets[4],
    MovesEntitySchema.deserialize,
    allOffsets,
    MovesEntity(),
  );
  object.name = reader.readStringOrNull(offsets[5]);
  object.number = reader.readLongOrNull(offsets[6]);
  object.order = reader.readLongOrNull(offsets[7]);
  object.stats = reader.readObjectList<StatsEntity>(
    offsets[8],
    StatsEntitySchema.deserialize,
    allOffsets,
    StatsEntity(),
  );
  object.types = reader.readObjectList<TypesEntity>(
    offsets[9],
    TypesEntitySchema.deserialize,
    allOffsets,
    TypesEntity(),
  );
  object.urlSprite = reader.readStringOrNull(offsets[10]);
  object.weight = reader.readLongOrNull(offsets[11]);
  return object;
}

P _pokemonEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<MovesEntity>(
        offset,
        MovesEntitySchema.deserialize,
        allOffsets,
        MovesEntity(),
      )) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readObjectList<StatsEntity>(
        offset,
        StatsEntitySchema.deserialize,
        allOffsets,
        StatsEntity(),
      )) as P;
    case 9:
      return (reader.readObjectList<TypesEntity>(
        offset,
        TypesEntitySchema.deserialize,
        allOffsets,
        TypesEntity(),
      )) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pokemonEntityGetId(PokemonEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pokemonEntityGetLinks(PokemonEntity object) {
  return [];
}

void _pokemonEntityAttach(
    IsarCollection<dynamic> col, Id id, PokemonEntity object) {
  object.id = id;
}

extension PokemonEntityQueryWhereSort
    on QueryBuilder<PokemonEntity, PokemonEntity, QWhere> {
  QueryBuilder<PokemonEntity, PokemonEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PokemonEntityQueryWhere
    on QueryBuilder<PokemonEntity, PokemonEntity, QWhereClause> {
  QueryBuilder<PokemonEntity, PokemonEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PokemonEntityQueryFilter
    on QueryBuilder<PokemonEntity, PokemonEntity, QFilterCondition> {
  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      baseExperienceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseExperience',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      baseExperienceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseExperience',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      baseExperienceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseExperience',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      baseExperienceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseExperience',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      baseExperienceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseExperience',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      baseExperienceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseExperience',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      generationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      generationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      generationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generation',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      generationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generation',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      generationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generation',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      generationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      heightEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      heightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      heightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      heightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      isDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isDefault',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      isDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isDefault',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      isDefaultEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefault',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      movesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      movesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      movesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      movesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      movesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      movesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      movesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      movesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      numberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      numberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      numberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      numberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      numberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      numberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      orderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      orderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      orderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      orderLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      orderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      statsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stats',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      statsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stats',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      statsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      statsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      statsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      statsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      statsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      statsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      typesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'types',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      typesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'types',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      typesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      typesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      typesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      typesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      typesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      typesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'urlSprite',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'urlSprite',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlSprite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'urlSprite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'urlSprite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'urlSprite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'urlSprite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'urlSprite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'urlSprite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'urlSprite',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlSprite',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      urlSpriteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'urlSprite',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      weightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      weightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      weightEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      weightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      weightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      weightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PokemonEntityQueryObject
    on QueryBuilder<PokemonEntity, PokemonEntity, QFilterCondition> {
  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      movesElement(FilterQuery<MovesEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moves');
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      statsElement(FilterQuery<StatsEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'stats');
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterFilterCondition>
      typesElement(FilterQuery<TypesEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'types');
    });
  }
}

extension PokemonEntityQueryLinks
    on QueryBuilder<PokemonEntity, PokemonEntity, QFilterCondition> {}

extension PokemonEntityQuerySortBy
    on QueryBuilder<PokemonEntity, PokemonEntity, QSortBy> {
  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      sortByBaseExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseExperience', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      sortByBaseExperienceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseExperience', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      sortByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      sortByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByUrlSprite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlSprite', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      sortByUrlSpriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlSprite', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension PokemonEntityQuerySortThenBy
    on QueryBuilder<PokemonEntity, PokemonEntity, QSortThenBy> {
  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      thenByBaseExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseExperience', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      thenByBaseExperienceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseExperience', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      thenByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      thenByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByUrlSprite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlSprite', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy>
      thenByUrlSpriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlSprite', Sort.desc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QAfterSortBy> thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension PokemonEntityQueryWhereDistinct
    on QueryBuilder<PokemonEntity, PokemonEntity, QDistinct> {
  QueryBuilder<PokemonEntity, PokemonEntity, QDistinct>
      distinctByBaseExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseExperience');
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QDistinct> distinctByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generation');
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QDistinct> distinctByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefault');
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QDistinct> distinctByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'number');
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QDistinct> distinctByUrlSprite(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'urlSprite', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PokemonEntity, PokemonEntity, QDistinct> distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }
}

extension PokemonEntityQueryProperty
    on QueryBuilder<PokemonEntity, PokemonEntity, QQueryProperty> {
  QueryBuilder<PokemonEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PokemonEntity, int?, QQueryOperations> baseExperienceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseExperience');
    });
  }

  QueryBuilder<PokemonEntity, int?, QQueryOperations> generationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generation');
    });
  }

  QueryBuilder<PokemonEntity, int?, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<PokemonEntity, bool?, QQueryOperations> isDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefault');
    });
  }

  QueryBuilder<PokemonEntity, List<MovesEntity>?, QQueryOperations>
      movesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moves');
    });
  }

  QueryBuilder<PokemonEntity, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PokemonEntity, int?, QQueryOperations> numberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'number');
    });
  }

  QueryBuilder<PokemonEntity, int?, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<PokemonEntity, List<StatsEntity>?, QQueryOperations>
      statsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stats');
    });
  }

  QueryBuilder<PokemonEntity, List<TypesEntity>?, QQueryOperations>
      typesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'types');
    });
  }

  QueryBuilder<PokemonEntity, String?, QQueryOperations> urlSpriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'urlSprite');
    });
  }

  QueryBuilder<PokemonEntity, int?, QQueryOperations> weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }
}
