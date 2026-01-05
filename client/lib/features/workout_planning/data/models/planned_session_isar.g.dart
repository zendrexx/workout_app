// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_session_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlannedSessionIsarCollection on Isar {
  IsarCollection<PlannedSessionIsar> get plannedSessionIsars =>
      this.collection();
}

const PlannedSessionIsarSchema = CollectionSchema(
  name: r'PlannedSessionIsar',
  id: 6442067316243507880,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _plannedSessionIsarEstimateSize,
  serialize: _plannedSessionIsarSerialize,
  deserialize: _plannedSessionIsarDeserialize,
  deserializeProp: _plannedSessionIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'plannedExercise': LinkSchema(
      id: -1460240402367288691,
      name: r'plannedExercise',
      target: r'PlannedExerciseIsar',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _plannedSessionIsarGetId,
  getLinks: _plannedSessionIsarGetLinks,
  attach: _plannedSessionIsarAttach,
  version: '3.1.0+1',
);

int _plannedSessionIsarEstimateSize(
  PlannedSessionIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _plannedSessionIsarSerialize(
  PlannedSessionIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.name);
}

PlannedSessionIsar _plannedSessionIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlannedSessionIsar(
    name: reader.readStringOrNull(offsets[1]),
  );
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  return object;
}

P _plannedSessionIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _plannedSessionIsarGetId(PlannedSessionIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _plannedSessionIsarGetLinks(
    PlannedSessionIsar object) {
  return [object.plannedExercise];
}

void _plannedSessionIsarAttach(
    IsarCollection<dynamic> col, Id id, PlannedSessionIsar object) {
  object.id = id;
  object.plannedExercise.attach(
      col, col.isar.collection<PlannedExerciseIsar>(), r'plannedExercise', id);
}

extension PlannedSessionIsarQueryWhereSort
    on QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QWhere> {
  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlannedSessionIsarQueryWhere
    on QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QWhereClause> {
  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterWhereClause>
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterWhereClause>
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

extension PlannedSessionIsarQueryFilter
    on QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QFilterCondition> {
  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
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

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension PlannedSessionIsarQueryObject
    on QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QFilterCondition> {}

extension PlannedSessionIsarQueryLinks
    on QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QFilterCondition> {
  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      plannedExercise(FilterQuery<PlannedExerciseIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'plannedExercise');
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      plannedExerciseLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'plannedExercise', length, true, length, true);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      plannedExerciseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'plannedExercise', 0, true, 0, true);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      plannedExerciseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'plannedExercise', 0, false, 999999, true);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      plannedExerciseLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'plannedExercise', 0, true, length, include);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      plannedExerciseLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'plannedExercise', length, include, 999999, true);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterFilterCondition>
      plannedExerciseLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'plannedExercise', lower, includeLower, upper, includeUpper);
    });
  }
}

extension PlannedSessionIsarQuerySortBy
    on QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QSortBy> {
  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PlannedSessionIsarQuerySortThenBy
    on QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QSortThenBy> {
  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PlannedSessionIsarQueryWhereDistinct
    on QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QDistinct> {
  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension PlannedSessionIsarQueryProperty
    on QueryBuilder<PlannedSessionIsar, PlannedSessionIsar, QQueryProperty> {
  QueryBuilder<PlannedSessionIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlannedSessionIsar, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PlannedSessionIsar, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
