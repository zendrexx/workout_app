// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performed_exercise_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPerformedExerciseIsarCollection on Isar {
  IsarCollection<PerformedExerciseIsar> get performedExerciseIsars =>
      this.collection();
}

const PerformedExerciseIsarSchema = CollectionSchema(
  name: r'PerformedExerciseIsar',
  id: -1933061483834111187,
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
    r'exerciseName': PropertySchema(
      id: 2,
      name: r'exerciseName',
      type: IsarType.string,
    ),
    r'imagePath': PropertySchema(
      id: 3,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.string,
    )
  },
  estimateSize: _performedExerciseIsarEstimateSize,
  serialize: _performedExerciseIsarSerialize,
  deserialize: _performedExerciseIsarDeserialize,
  deserializeProp: _performedExerciseIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'sets': LinkSchema(
      id: 954664239586483706,
      name: r'sets',
      target: r'PerformedSetsIsar',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _performedExerciseIsarGetId,
  getLinks: _performedExerciseIsarGetLinks,
  attach: _performedExerciseIsarAttach,
  version: '3.1.0+1',
);

int _performedExerciseIsarEstimateSize(
  PerformedExerciseIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.equipment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.exId.length * 3;
  bytesCount += 3 + object.exerciseName.length * 3;
  bytesCount += 3 + object.imagePath.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _performedExerciseIsarSerialize(
  PerformedExerciseIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.equipment);
  writer.writeString(offsets[1], object.exId);
  writer.writeString(offsets[2], object.exerciseName);
  writer.writeString(offsets[3], object.imagePath);
  writer.writeString(offsets[4], object.notes);
}

PerformedExerciseIsar _performedExerciseIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerformedExerciseIsar();
  object.equipment = reader.readStringOrNull(offsets[0]);
  object.exId = reader.readString(offsets[1]);
  object.exerciseName = reader.readString(offsets[2]);
  object.id = id;
  object.imagePath = reader.readString(offsets[3]);
  object.notes = reader.readStringOrNull(offsets[4]);
  return object;
}

P _performedExerciseIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _performedExerciseIsarGetId(PerformedExerciseIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _performedExerciseIsarGetLinks(
    PerformedExerciseIsar object) {
  return [object.sets];
}

void _performedExerciseIsarAttach(
    IsarCollection<dynamic> col, Id id, PerformedExerciseIsar object) {
  object.id = id;
  object.sets
      .attach(col, col.isar.collection<PerformedSetsIsar>(), r'sets', id);
}

extension PerformedExerciseIsarQueryWhereSort
    on QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QWhere> {
  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PerformedExerciseIsarQueryWhere on QueryBuilder<PerformedExerciseIsar,
    PerformedExerciseIsar, QWhereClause> {
  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterWhereClause>
      idBetween(
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

extension PerformedExerciseIsarQueryFilter on QueryBuilder<
    PerformedExerciseIsar, PerformedExerciseIsar, QFilterCondition> {
  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equipment',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equipment',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentEqualTo(
    String? value, {
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentGreaterThan(
    String? value, {
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentLessThan(
    String? value, {
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentStartsWith(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentEndsWith(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      equipmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      equipmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equipment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipment',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> equipmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipment',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exIdEqualTo(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exIdGreaterThan(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exIdLessThan(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exIdBetween(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exIdStartsWith(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exIdEndsWith(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      exIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      exIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exId',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exId',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exerciseNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exerciseNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exerciseNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exerciseNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exerciseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exerciseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      exerciseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      exerciseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exerciseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> exerciseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> imagePathEqualTo(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> imagePathGreaterThan(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> imagePathLessThan(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> imagePathBetween(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> imagePathStartsWith(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> imagePathEndsWith(
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

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }
}

extension PerformedExerciseIsarQueryObject on QueryBuilder<
    PerformedExerciseIsar, PerformedExerciseIsar, QFilterCondition> {}

extension PerformedExerciseIsarQueryLinks on QueryBuilder<PerformedExerciseIsar,
    PerformedExerciseIsar, QFilterCondition> {
  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> sets(FilterQuery<PerformedSetsIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'sets');
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> setsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', length, true, length, true);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> setsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', 0, true, 0, true);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> setsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', 0, false, 999999, true);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> setsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', 0, true, length, include);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> setsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', length, include, 999999, true);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar,
      QAfterFilterCondition> setsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'sets', lower, includeLower, upper, includeUpper);
    });
  }
}

extension PerformedExerciseIsarQuerySortBy
    on QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QSortBy> {
  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByEquipment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByEquipmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.desc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByExId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByExIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.desc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }
}

extension PerformedExerciseIsarQuerySortThenBy
    on QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QSortThenBy> {
  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByEquipment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByEquipmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.desc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByExId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByExIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.desc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }
}

extension PerformedExerciseIsarQueryWhereDistinct
    on QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QDistinct> {
  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QDistinct>
      distinctByEquipment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QDistinct>
      distinctByExId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QDistinct>
      distinctByExerciseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QDistinct>
      distinctByImagePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformedExerciseIsar, PerformedExerciseIsar, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }
}

extension PerformedExerciseIsarQueryProperty on QueryBuilder<
    PerformedExerciseIsar, PerformedExerciseIsar, QQueryProperty> {
  QueryBuilder<PerformedExerciseIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerformedExerciseIsar, String?, QQueryOperations>
      equipmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipment');
    });
  }

  QueryBuilder<PerformedExerciseIsar, String, QQueryOperations> exIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exId');
    });
  }

  QueryBuilder<PerformedExerciseIsar, String, QQueryOperations>
      exerciseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseName');
    });
  }

  QueryBuilder<PerformedExerciseIsar, String, QQueryOperations>
      imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<PerformedExerciseIsar, String?, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }
}
