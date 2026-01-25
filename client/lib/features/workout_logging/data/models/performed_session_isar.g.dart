// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performed_session_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPerformedSessionIsarCollection on Isar {
  IsarCollection<PerformedSessionIsar> get performedSessionIsars =>
      this.collection();
}

const PerformedSessionIsarSchema = CollectionSchema(
  name: r'PerformedSessionIsar',
  id: 915096996374305828,
  properties: {
    r'endTime': PropertySchema(
      id: 0,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 1,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'performedSessionId': PropertySchema(
      id: 3,
      name: r'performedSessionId',
      type: IsarType.string,
    )
  },
  estimateSize: _performedSessionIsarEstimateSize,
  serialize: _performedSessionIsarSerialize,
  deserialize: _performedSessionIsarDeserialize,
  deserializeProp: _performedSessionIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'performedSessionId': IndexSchema(
      id: -486166985866659318,
      name: r'performedSessionId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'performedSessionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'performedStats': LinkSchema(
      id: -1592939135825516075,
      name: r'performedStats',
      target: r'PerformedStatsIsar',
      single: true,
    ),
    r'performedExercises': LinkSchema(
      id: 8901251391997527427,
      name: r'performedExercises',
      target: r'PerformedExerciseIsar',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _performedSessionIsarGetId,
  getLinks: _performedSessionIsarGetLinks,
  attach: _performedSessionIsarAttach,
  version: '3.1.0+1',
);

int _performedSessionIsarEstimateSize(
  PerformedSessionIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.performedSessionId.length * 3;
  return bytesCount;
}

void _performedSessionIsarSerialize(
  PerformedSessionIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endTime);
  writer.writeBool(offsets[1], object.isCompleted);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.performedSessionId);
}

PerformedSessionIsar _performedSessionIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerformedSessionIsar();
  object.endTime = reader.readDateTime(offsets[0]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.performedSessionId = reader.readString(offsets[3]);
  return object;
}

P _performedSessionIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _performedSessionIsarGetId(PerformedSessionIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _performedSessionIsarGetLinks(
    PerformedSessionIsar object) {
  return [object.performedStats, object.performedExercises];
}

void _performedSessionIsarAttach(
    IsarCollection<dynamic> col, Id id, PerformedSessionIsar object) {
  object.id = id;
  object.performedStats.attach(
      col, col.isar.collection<PerformedStatsIsar>(), r'performedStats', id);
  object.performedExercises.attach(col,
      col.isar.collection<PerformedExerciseIsar>(), r'performedExercises', id);
}

extension PerformedSessionIsarByIndex on IsarCollection<PerformedSessionIsar> {
  Future<PerformedSessionIsar?> getByPerformedSessionId(
      String performedSessionId) {
    return getByIndex(r'performedSessionId', [performedSessionId]);
  }

  PerformedSessionIsar? getByPerformedSessionIdSync(String performedSessionId) {
    return getByIndexSync(r'performedSessionId', [performedSessionId]);
  }

  Future<bool> deleteByPerformedSessionId(String performedSessionId) {
    return deleteByIndex(r'performedSessionId', [performedSessionId]);
  }

  bool deleteByPerformedSessionIdSync(String performedSessionId) {
    return deleteByIndexSync(r'performedSessionId', [performedSessionId]);
  }

  Future<List<PerformedSessionIsar?>> getAllByPerformedSessionId(
      List<String> performedSessionIdValues) {
    final values = performedSessionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'performedSessionId', values);
  }

  List<PerformedSessionIsar?> getAllByPerformedSessionIdSync(
      List<String> performedSessionIdValues) {
    final values = performedSessionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'performedSessionId', values);
  }

  Future<int> deleteAllByPerformedSessionId(
      List<String> performedSessionIdValues) {
    final values = performedSessionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'performedSessionId', values);
  }

  int deleteAllByPerformedSessionIdSync(List<String> performedSessionIdValues) {
    final values = performedSessionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'performedSessionId', values);
  }

  Future<Id> putByPerformedSessionId(PerformedSessionIsar object) {
    return putByIndex(r'performedSessionId', object);
  }

  Id putByPerformedSessionIdSync(PerformedSessionIsar object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'performedSessionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPerformedSessionId(
      List<PerformedSessionIsar> objects) {
    return putAllByIndex(r'performedSessionId', objects);
  }

  List<Id> putAllByPerformedSessionIdSync(List<PerformedSessionIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'performedSessionId', objects,
        saveLinks: saveLinks);
  }
}

extension PerformedSessionIsarQueryWhereSort
    on QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QWhere> {
  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PerformedSessionIsarQueryWhere
    on QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QWhereClause> {
  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterWhereClause>
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterWhereClause>
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterWhereClause>
      performedSessionIdEqualTo(String performedSessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'performedSessionId',
        value: [performedSessionId],
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterWhereClause>
      performedSessionIdNotEqualTo(String performedSessionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'performedSessionId',
              lower: [],
              upper: [performedSessionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'performedSessionId',
              lower: [performedSessionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'performedSessionId',
              lower: [performedSessionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'performedSessionId',
              lower: [],
              upper: [performedSessionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PerformedSessionIsarQueryFilter on QueryBuilder<PerformedSessionIsar,
    PerformedSessionIsar, QFilterCondition> {
  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> endTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> endTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> endTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> endTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedSessionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performedSessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedSessionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performedSessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedSessionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performedSessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedSessionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performedSessionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedSessionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'performedSessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedSessionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'performedSessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
          QAfterFilterCondition>
      performedSessionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'performedSessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
          QAfterFilterCondition>
      performedSessionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'performedSessionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedSessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performedSessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedSessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'performedSessionId',
        value: '',
      ));
    });
  }
}

extension PerformedSessionIsarQueryObject on QueryBuilder<PerformedSessionIsar,
    PerformedSessionIsar, QFilterCondition> {}

extension PerformedSessionIsarQueryLinks on QueryBuilder<PerformedSessionIsar,
    PerformedSessionIsar, QFilterCondition> {
  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedStats(FilterQuery<PerformedStatsIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'performedStats');
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedStatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performedStats', 0, true, 0, true);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
          QAfterFilterCondition>
      performedExercises(FilterQuery<PerformedExerciseIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'performedExercises');
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedExercisesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performedExercises', length, true, length, true);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedExercisesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performedExercises', 0, true, 0, true);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedExercisesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performedExercises', 0, false, 999999, true);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedExercisesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performedExercises', 0, true, length, include);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedExercisesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performedExercises', length, include, 999999, true);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar,
      QAfterFilterCondition> performedExercisesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performedExercises', lower, includeLower, upper, includeUpper);
    });
  }
}

extension PerformedSessionIsarQuerySortBy
    on QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QSortBy> {
  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      sortByPerformedSessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedSessionId', Sort.asc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      sortByPerformedSessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedSessionId', Sort.desc);
    });
  }
}

extension PerformedSessionIsarQuerySortThenBy
    on QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QSortThenBy> {
  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenByPerformedSessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedSessionId', Sort.asc);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QAfterSortBy>
      thenByPerformedSessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedSessionId', Sort.desc);
    });
  }
}

extension PerformedSessionIsarQueryWhereDistinct
    on QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QDistinct> {
  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QDistinct>
      distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformedSessionIsar, PerformedSessionIsar, QDistinct>
      distinctByPerformedSessionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performedSessionId',
          caseSensitive: caseSensitive);
    });
  }
}

extension PerformedSessionIsarQueryProperty on QueryBuilder<
    PerformedSessionIsar, PerformedSessionIsar, QQueryProperty> {
  QueryBuilder<PerformedSessionIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerformedSessionIsar, DateTime, QQueryOperations>
      endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<PerformedSessionIsar, bool, QQueryOperations>
      isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<PerformedSessionIsar, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PerformedSessionIsar, String, QQueryOperations>
      performedSessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performedSessionId');
    });
  }
}
