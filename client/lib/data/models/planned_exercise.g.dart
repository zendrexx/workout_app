// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_exercise.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlannedExerciseCollection on Isar {
  IsarCollection<PlannedExercise> get plannedExercises => this.collection();
}

const PlannedExerciseSchema = CollectionSchema(
  name: r'PlannedExercise',
  id: 2108066440655788781,
  properties: {
    r'equipment': PropertySchema(
      id: 0,
      name: r'equipment',
      type: IsarType.string,
    ),
    r'exerciseName': PropertySchema(
      id: 1,
      name: r'exerciseName',
      type: IsarType.string,
    ),
    r'exercisePath': PropertySchema(
      id: 2,
      name: r'exercisePath',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 3,
      name: r'notes',
      type: IsarType.string,
    )
  },
  estimateSize: _plannedExerciseEstimateSize,
  serialize: _plannedExerciseSerialize,
  deserialize: _plannedExerciseDeserialize,
  deserializeProp: _plannedExerciseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'sets': LinkSchema(
      id: -3448120385856399442,
      name: r'sets',
      target: r'PlannedSet',
      single: false,
    ),
    r'session': LinkSchema(
      id: 6345234935340735891,
      name: r'session',
      target: r'PlannedSession',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _plannedExerciseGetId,
  getLinks: _plannedExerciseGetLinks,
  attach: _plannedExerciseAttach,
  version: '3.1.0+1',
);

int _plannedExerciseEstimateSize(
  PlannedExercise object,
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

void _plannedExerciseSerialize(
  PlannedExercise object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.equipment);
  writer.writeString(offsets[1], object.exerciseName);
  writer.writeString(offsets[2], object.exercisePath);
  writer.writeString(offsets[3], object.notes);
}

PlannedExercise _plannedExerciseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlannedExercise(
    notes: reader.readStringOrNull(offsets[3]),
  );
  object.equipment = reader.readStringOrNull(offsets[0]);
  object.exerciseName = reader.readStringOrNull(offsets[1]);
  object.exercisePath = reader.readStringOrNull(offsets[2]);
  object.id = id;
  return object;
}

P _plannedExerciseDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _plannedExerciseGetId(PlannedExercise object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _plannedExerciseGetLinks(PlannedExercise object) {
  return [object.sets, object.session];
}

void _plannedExerciseAttach(
    IsarCollection<dynamic> col, Id id, PlannedExercise object) {
  object.id = id;
  object.sets.attach(col, col.isar.collection<PlannedSet>(), r'sets', id);
  object.session
      .attach(col, col.isar.collection<PlannedSession>(), r'session', id);
}

extension PlannedExerciseQueryWhereSort
    on QueryBuilder<PlannedExercise, PlannedExercise, QWhere> {
  QueryBuilder<PlannedExercise, PlannedExercise, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlannedExerciseQueryWhere
    on QueryBuilder<PlannedExercise, PlannedExercise, QWhereClause> {
  QueryBuilder<PlannedExercise, PlannedExercise, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterWhereClause>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterWhereClause> idBetween(
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

extension PlannedExerciseQueryFilter
    on QueryBuilder<PlannedExercise, PlannedExercise, QFilterCondition> {
  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      equipmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equipment',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      equipmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equipment',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      equipmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equipment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      equipmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equipment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      equipmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equipment',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      equipmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equipment',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exerciseNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exerciseName',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exerciseNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exerciseName',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exerciseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exerciseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exerciseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exerciseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exercisePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exercisePath',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exercisePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exercisePath',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exercisePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exercisePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exercisePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exercisePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exercisePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercisePath',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      exercisePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exercisePath',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }
}

extension PlannedExerciseQueryObject
    on QueryBuilder<PlannedExercise, PlannedExercise, QFilterCondition> {}

extension PlannedExerciseQueryLinks
    on QueryBuilder<PlannedExercise, PlannedExercise, QFilterCondition> {
  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition> sets(
      FilterQuery<PlannedSet> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'sets');
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      setsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', length, true, length, true);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      setsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', 0, true, 0, true);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      setsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', 0, false, 999999, true);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      setsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', 0, true, length, include);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      setsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sets', length, include, 999999, true);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
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

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition> session(
      FilterQuery<PlannedSession> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'session');
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterFilterCondition>
      sessionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'session', 0, true, 0, true);
    });
  }
}

extension PlannedExerciseQuerySortBy
    on QueryBuilder<PlannedExercise, PlannedExercise, QSortBy> {
  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      sortByEquipment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.asc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      sortByEquipmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.desc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      sortByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      sortByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      sortByExercisePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisePath', Sort.asc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      sortByExercisePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisePath', Sort.desc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }
}

extension PlannedExerciseQuerySortThenBy
    on QueryBuilder<PlannedExercise, PlannedExercise, QSortThenBy> {
  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      thenByEquipment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.asc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      thenByEquipmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equipment', Sort.desc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      thenByExerciseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.asc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      thenByExerciseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exerciseName', Sort.desc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      thenByExercisePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisePath', Sort.asc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      thenByExercisePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exercisePath', Sort.desc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }
}

extension PlannedExerciseQueryWhereDistinct
    on QueryBuilder<PlannedExercise, PlannedExercise, QDistinct> {
  QueryBuilder<PlannedExercise, PlannedExercise, QDistinct> distinctByEquipment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equipment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QDistinct>
      distinctByExerciseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QDistinct>
      distinctByExercisePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exercisePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlannedExercise, PlannedExercise, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }
}

extension PlannedExerciseQueryProperty
    on QueryBuilder<PlannedExercise, PlannedExercise, QQueryProperty> {
  QueryBuilder<PlannedExercise, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlannedExercise, String?, QQueryOperations> equipmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equipment');
    });
  }

  QueryBuilder<PlannedExercise, String?, QQueryOperations>
      exerciseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseName');
    });
  }

  QueryBuilder<PlannedExercise, String?, QQueryOperations>
      exercisePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exercisePath');
    });
  }

  QueryBuilder<PlannedExercise, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }
}
