// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExerciseIsarCollection on Isar {
  IsarCollection<ExerciseIsar> get exerciseIsars => this.collection();
}

const ExerciseIsarSchema = CollectionSchema(
  name: r'ExerciseIsar',
  id: -8781596793542487269,
  properties: {
    r'equipment': PropertySchema(
      id: 0,
      name: r'equipment',
      type: IsarType.string,
    ),
    r'exId': PropertySchema(
      id: 1,
      name: r'exId',
      type: IsarType.string,
    ),
    r'imagePath': PropertySchema(
      id: 2,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'primMuscle': PropertySchema(
      id: 4,
      name: r'primMuscle',
      type: IsarType.string,
    ),
    r'seconMuscle': PropertySchema(
      id: 5,
      name: r'seconMuscle',
      type: IsarType.string,
    )
  },
  estimateSize: _exerciseIsarEstimateSize,
  serialize: _exerciseIsarSerialize,
  deserialize: _exerciseIsarDeserialize,
  deserializeProp: _exerciseIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'exId': IndexSchema(
      id: 2382449665185005046,
      name: r'exId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'exId',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'primMuscle': IndexSchema(
      id: -8953997443157277351,
      name: r'primMuscle',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'primMuscle',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _exerciseIsarGetId,
  getLinks: _exerciseIsarGetLinks,
  attach: _exerciseIsarAttach,
  version: '3.1.0+1',
);

int _exerciseIsarEstimateSize(
  ExerciseIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.equipment.length * 3;
  bytesCount += 3 + object.exId.length * 3;
  bytesCount += 3 + object.imagePath.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.primMuscle.length * 3;
  {
    final value = object.seconMuscle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _exerciseIsarSerialize(
  ExerciseIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.equipment);
  writer.writeString(offsets[1], object.exId);
  writer.writeString(offsets[2], object.imagePath);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.primMuscle);
  writer.writeString(offsets[5], object.seconMuscle);
}

ExerciseIsar _exerciseIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExerciseIsar(
    equipment: reader.readString(offsets[0]),
    exId: reader.readString(offsets[1]),
    imagePath: reader.readString(offsets[2]),
    name: reader.readString(offsets[3]),
    primMuscle: reader.readString(offsets[4]),
    seconMuscle: reader.readStringOrNull(offsets[5]),
  );
  object.id = id;
  return object;
}

P _exerciseIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _exerciseIsarGetId(ExerciseIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _exerciseIsarGetLinks(ExerciseIsar object) {
  return [];
}

void _exerciseIsarAttach(
    IsarCollection<dynamic> col, Id id, ExerciseIsar object) {
  object.id = id;
}

extension ExerciseIsarQueryWhereSort
    on QueryBuilder<ExerciseIsar, ExerciseIsar, QWhere> {
  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhere> anyExId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'exId'),
      );
    });
  }
}

extension ExerciseIsarQueryWhere
    on QueryBuilder<ExerciseIsar, ExerciseIsar, QWhereClause> {
  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> exIdEqualTo(
      String exId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'exId',
        value: [exId],
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> exIdNotEqualTo(
      String exId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exId',
              lower: [],
              upper: [exId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exId',
              lower: [exId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exId',
              lower: [exId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'exId',
              lower: [],
              upper: [exId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> exIdGreaterThan(
    String exId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'exId',
        lower: [exId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> exIdLessThan(
    String exId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'exId',
        lower: [],
        upper: [exId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> exIdBetween(
    String lowerExId,
    String upperExId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'exId',
        lower: [lowerExId],
        includeLower: includeLower,
        upper: [upperExId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> exIdStartsWith(
      String ExIdPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'exId',
        lower: [ExIdPrefix],
        upper: ['$ExIdPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> exIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'exId',
        value: [''],
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> exIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'exId',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'exId',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'exId',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'exId',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> nameNotEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause> primMuscleEqualTo(
      String primMuscle) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'primMuscle',
        value: [primMuscle],
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterWhereClause>
      primMuscleNotEqualTo(String primMuscle) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'primMuscle',
              lower: [],
              upper: [primMuscle],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'primMuscle',
              lower: [primMuscle],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'primMuscle',
              lower: [primMuscle],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'primMuscle',
              lower: [],
              upper: [primMuscle],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ExerciseIsarQueryFilter
    on QueryBuilder<ExerciseIsar, ExerciseIsar, QFilterCondition> {
  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equipment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equipment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equipment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equipment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equipment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equipment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipment',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      equipmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipment',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> exIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      exIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> exIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> exIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      exIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> exIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> exIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> exIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      exIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exId',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      exIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exId',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> nameEqualTo(
    String value, {
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> nameLessThan(
    String value, {
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'primMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'primMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'primMuscle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'primMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'primMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'primMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'primMuscle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primMuscle',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      primMuscleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'primMuscle',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'seconMuscle',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'seconMuscle',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seconMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seconMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seconMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seconMuscle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'seconMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'seconMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'seconMuscle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'seconMuscle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seconMuscle',
        value: '',
      ));
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterFilterCondition>
      seconMuscleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'seconMuscle',
        value: '',
      ));
    });
  }
}

extension ExerciseIsarQueryObject
    on QueryBuilder<ExerciseIsar, ExerciseIsar, QFilterCondition> {}

extension ExerciseIsarQueryLinks
    on QueryBuilder<ExerciseIsar, ExerciseIsar, QFilterCondition> {}

extension ExerciseIsarQuerySortBy
    on QueryBuilder<ExerciseIsar, ExerciseIsar, QSortBy> {
  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortByEquipment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortByEquipmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortByExId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortByExIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortByPrimMuscle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primMuscle', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy>
      sortByPrimMuscleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primMuscle', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> sortBySeconMuscle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconMuscle', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy>
      sortBySeconMuscleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconMuscle', Sort.desc);
    });
  }
}

extension ExerciseIsarQuerySortThenBy
    on QueryBuilder<ExerciseIsar, ExerciseIsar, QSortThenBy> {
  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByEquipment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByEquipmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByExId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByExIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenByPrimMuscle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primMuscle', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy>
      thenByPrimMuscleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primMuscle', Sort.desc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy> thenBySeconMuscle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconMuscle', Sort.asc);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QAfterSortBy>
      thenBySeconMuscleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconMuscle', Sort.desc);
    });
  }
}

extension ExerciseIsarQueryWhereDistinct
    on QueryBuilder<ExerciseIsar, ExerciseIsar, QDistinct> {
  QueryBuilder<ExerciseIsar, ExerciseIsar, QDistinct> distinctByEquipment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QDistinct> distinctByExId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QDistinct> distinctByPrimMuscle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primMuscle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExerciseIsar, ExerciseIsar, QDistinct> distinctBySeconMuscle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seconMuscle', caseSensitive: caseSensitive);
    });
  }
}

extension ExerciseIsarQueryProperty
    on QueryBuilder<ExerciseIsar, ExerciseIsar, QQueryProperty> {
  QueryBuilder<ExerciseIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExerciseIsar, String, QQueryOperations> equipmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipment');
    });
  }

  QueryBuilder<ExerciseIsar, String, QQueryOperations> exIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exId');
    });
  }

  QueryBuilder<ExerciseIsar, String, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<ExerciseIsar, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ExerciseIsar, String, QQueryOperations> primMuscleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primMuscle');
    });
  }

  QueryBuilder<ExerciseIsar, String?, QQueryOperations> seconMuscleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seconMuscle');
    });
  }
}
