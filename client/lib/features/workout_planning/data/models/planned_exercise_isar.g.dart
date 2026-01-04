// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_exercise_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlannedExerciseIsarCollection on Isar {
  IsarCollection<PlannedExerciseIsar> get plannedExerciseIsars =>
      this.collection();
}

const PlannedExerciseIsarSchema = CollectionSchema(
  name: r'PlannedExerciseIsar',
  id: -4861695477918819806,
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
    r'exercisePath': PropertySchema(
      id: 3,
      name: r'exercisePath',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.string,
    )
  },
  estimateSize: _plannedExerciseIsarEstimateSize,
  serialize: _plannedExerciseIsarSerialize,
  deserialize: _plannedExerciseIsarDeserialize,
  deserializeProp: _plannedExerciseIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'sets': LinkSchema(
      id: 1186908323298436952,
      name: r'sets',
      target: r'PlannedSetIsar',
      single: false,
    ),
    r'session': LinkSchema(
      id: 5506050939291928853,
      name: r'session',
      target: r'PlannedSessionIsar',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _plannedExerciseIsarGetId,
  getLinks: _plannedExerciseIsarGetLinks,
  attach: _plannedExerciseIsarAttach,
  version: '3.1.0+1',
);

int _plannedExerciseIsarEstimateSize(
  PlannedExerciseIsar object,
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
  {
    final value = object.exId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.exerciseName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.exercisePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _plannedExerciseIsarSerialize(
  PlannedExerciseIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.equipment);
  writer.writeString(offsets[1], object.exId);
  writer.writeString(offsets[2], object.exerciseName);
  writer.writeString(offsets[3], object.exercisePath);
  writer.writeString(offsets[4], object.notes);
}

PlannedExerciseIsar _plannedExerciseIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlannedExerciseIsar(
    notes: reader.readStringOrNull(offsets[4]),
  );
  object.equipment = reader.readStringOrNull(offsets[0]);
  object.exId = reader.readStringOrNull(offsets[1]);
  object.exerciseName = reader.readStringOrNull(offsets[2]);
  object.exercisePath = reader.readStringOrNull(offsets[3]);
  object.id = id;
  return object;
}

P _plannedExerciseIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _plannedExerciseIsarGetId(PlannedExerciseIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _plannedExerciseIsarGetLinks(
    PlannedExerciseIsar object) {
  return [object.sets, object.session];
}

void _plannedExerciseIsarAttach(
    IsarCollection<dynamic> col, Id id, PlannedExerciseIsar object) {
  object.id = id;
  object.sets.attach(col, col.isar.collection<PlannedSetIsar>(), r'sets', id);
  object.session
      .attach(col, col.isar.collection<PlannedSessionIsar>(), r'session', id);
}

extension PlannedExerciseIsarQueryWhereSort
    on QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QWhere> {
  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlannedExerciseIsarQueryWhere
    on QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QWhereClause> {
  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterWhereClause>
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterWhereClause>
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

extension PlannedExerciseIsarQueryFilter on QueryBuilder<PlannedExerciseIsar,
    PlannedExerciseIsar, QFilterCondition> {
  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equipment',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equipment',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentEqualTo(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentGreaterThan(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentLessThan(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentBetween(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equipment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipment',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      equipmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipment',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exId',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exId',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdEqualTo(
    String? value, {
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdGreaterThan(
    String? value, {
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdLessThan(
    String? value, {
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdEndsWith(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exerciseName',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exerciseName',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameEqualTo(
    String? value, {
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameGreaterThan(
    String? value, {
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameLessThan(
    String? value, {
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameStartsWith(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameEndsWith(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exerciseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exercisePath',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exercisePath',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercisePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exercisePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exercisePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exercisePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exercisePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exercisePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exercisePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exercisePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercisePath',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      exercisePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exercisePath',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesEqualTo(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesGreaterThan(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesLessThan(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesBetween(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesStartsWith(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesEndsWith(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }
}

extension PlannedExerciseIsarQueryObject on QueryBuilder<PlannedExerciseIsar,
    PlannedExerciseIsar, QFilterCondition> {}

extension PlannedExerciseIsarQueryLinks on QueryBuilder<PlannedExerciseIsar,
    PlannedExerciseIsar, QFilterCondition> {
  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      sets(FilterQuery<PlannedSetIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'sets');
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      setsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', length, true, length, true);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      setsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', 0, true, 0, true);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      setsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', 0, false, 999999, true);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      setsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', 0, true, length, include);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      setsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', length, include, 999999, true);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      setsLengthBetween(
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

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      session(FilterQuery<PlannedSessionIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'session');
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterFilterCondition>
      sessionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'session', 0, true, 0, true);
    });
  }
}

extension PlannedExerciseIsarQuerySortBy
    on QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QSortBy> {
  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByEquipment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByEquipmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.desc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByExId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByExIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.desc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByExercisePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisePath', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByExercisePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisePath', Sort.desc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }
}

extension PlannedExerciseIsarQuerySortThenBy
    on QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QSortThenBy> {
  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByEquipment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByEquipmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.desc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByExId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByExIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exId', Sort.desc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByExercisePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisePath', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByExercisePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisePath', Sort.desc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }
}

extension PlannedExerciseIsarQueryWhereDistinct
    on QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QDistinct> {
  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QDistinct>
      distinctByEquipment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QDistinct>
      distinctByExId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QDistinct>
      distinctByExerciseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QDistinct>
      distinctByExercisePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exercisePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }
}

extension PlannedExerciseIsarQueryProperty
    on QueryBuilder<PlannedExerciseIsar, PlannedExerciseIsar, QQueryProperty> {
  QueryBuilder<PlannedExerciseIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlannedExerciseIsar, String?, QQueryOperations>
      equipmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipment');
    });
  }

  QueryBuilder<PlannedExerciseIsar, String?, QQueryOperations> exIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exId');
    });
  }

  QueryBuilder<PlannedExerciseIsar, String?, QQueryOperations>
      exerciseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseName');
    });
  }

  QueryBuilder<PlannedExerciseIsar, String?, QQueryOperations>
      exercisePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exercisePath');
    });
  }

  QueryBuilder<PlannedExerciseIsar, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }
}
