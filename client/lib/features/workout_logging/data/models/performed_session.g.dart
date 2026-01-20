// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performed_session.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPerformedSessionCollection on Isar {
  IsarCollection<PerformedSession> get performedSessions => this.collection();
}

const PerformedSessionSchema = CollectionSchema(
  name: r'PerformedSession',
  id: 4533096295120083339,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endTime': PropertySchema(
      id: 1,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 2,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'performedSessionId': PropertySchema(
      id: 4,
      name: r'performedSessionId',
      type: IsarType.string,
    )
  },
  estimateSize: _performedSessionEstimateSize,
  serialize: _performedSessionSerialize,
  deserialize: _performedSessionDeserialize,
  deserializeProp: _performedSessionDeserializeProp,
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
    r'workoutStats': LinkSchema(
      id: -6490455185469628109,
      name: r'workoutStats',
      target: r'WorkoutStats',
      single: false,
    ),
    r'performedExercises': LinkSchema(
      id: -6347777387453188089,
      name: r'performedExercises',
      target: r'PerformedExercise',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _performedSessionGetId,
  getLinks: _performedSessionGetLinks,
  attach: _performedSessionAttach,
  version: '3.1.0+1',
);

int _performedSessionEstimateSize(
  PerformedSession object,
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
  bytesCount += 3 + object.performedSessionId.length * 3;
  return bytesCount;
}

void _performedSessionSerialize(
  PerformedSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.endTime);
  writer.writeBool(offsets[2], object.isCompleted);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.performedSessionId);
}

PerformedSession _performedSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerformedSession();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.endTime = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[2]);
  object.name = reader.readStringOrNull(offsets[3]);
  object.performedSessionId = reader.readString(offsets[4]);
  return object;
}

P _performedSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _performedSessionGetId(PerformedSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _performedSessionGetLinks(PerformedSession object) {
  return [object.workoutStats, object.performedExercises];
}

void _performedSessionAttach(
    IsarCollection<dynamic> col, Id id, PerformedSession object) {
  object.id = id;
  object.workoutStats
      .attach(col, col.isar.collection<WorkoutStats>(), r'workoutStats', id);
  object.performedExercises.attach(
      col, col.isar.collection<PerformedExercise>(), r'performedExercises', id);
}

extension PerformedSessionByIndex on IsarCollection<PerformedSession> {
  Future<PerformedSession?> getByPerformedSessionId(String performedSessionId) {
    return getByIndex(r'performedSessionId', [performedSessionId]);
  }

  PerformedSession? getByPerformedSessionIdSync(String performedSessionId) {
    return getByIndexSync(r'performedSessionId', [performedSessionId]);
  }

  Future<bool> deleteByPerformedSessionId(String performedSessionId) {
    return deleteByIndex(r'performedSessionId', [performedSessionId]);
  }

  bool deleteByPerformedSessionIdSync(String performedSessionId) {
    return deleteByIndexSync(r'performedSessionId', [performedSessionId]);
  }

  Future<List<PerformedSession?>> getAllByPerformedSessionId(
      List<String> performedSessionIdValues) {
    final values = performedSessionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'performedSessionId', values);
  }

  List<PerformedSession?> getAllByPerformedSessionIdSync(
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

  Future<Id> putByPerformedSessionId(PerformedSession object) {
    return putByIndex(r'performedSessionId', object);
  }

  Id putByPerformedSessionIdSync(PerformedSession object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'performedSessionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPerformedSessionId(List<PerformedSession> objects) {
    return putAllByIndex(r'performedSessionId', objects);
  }

  List<Id> putAllByPerformedSessionIdSync(List<PerformedSession> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'performedSessionId', objects,
        saveLinks: saveLinks);
  }
}

extension PerformedSessionQueryWhereSort
    on QueryBuilder<PerformedSession, PerformedSession, QWhere> {
  QueryBuilder<PerformedSession, PerformedSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PerformedSessionQueryWhere
    on QueryBuilder<PerformedSession, PerformedSession, QWhereClause> {
  QueryBuilder<PerformedSession, PerformedSession, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterWhereClause>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterWhereClause> idBetween(
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterWhereClause>
      performedSessionIdEqualTo(String performedSessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'performedSessionId',
        value: [performedSessionId],
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterWhereClause>
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

extension PerformedSessionQueryFilter
    on QueryBuilder<PerformedSession, PerformedSession, QFilterCondition> {
  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdEqualTo(
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdGreaterThan(
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdLessThan(
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdBetween(
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdStartsWith(
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdEndsWith(
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

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'performedSessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'performedSessionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performedSessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedSessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'performedSessionId',
        value: '',
      ));
    });
  }
}

extension PerformedSessionQueryObject
    on QueryBuilder<PerformedSession, PerformedSession, QFilterCondition> {}

extension PerformedSessionQueryLinks
    on QueryBuilder<PerformedSession, PerformedSession, QFilterCondition> {
  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      workoutStats(FilterQuery<WorkoutStats> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'workoutStats');
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      workoutStatsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workoutStats', length, true, length, true);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      workoutStatsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workoutStats', 0, true, 0, true);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      workoutStatsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workoutStats', 0, false, 999999, true);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      workoutStatsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workoutStats', 0, true, length, include);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      workoutStatsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workoutStats', length, include, 999999, true);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      workoutStatsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'workoutStats', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedExercises(FilterQuery<PerformedExercise> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'performedExercises');
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedExercisesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performedExercises', length, true, length, true);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedExercisesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performedExercises', 0, true, 0, true);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedExercisesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performedExercises', 0, false, 999999, true);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedExercisesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performedExercises', 0, true, length, include);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedExercisesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performedExercises', length, include, 999999, true);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterFilterCondition>
      performedExercisesLengthBetween(
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

extension PerformedSessionQuerySortBy
    on QueryBuilder<PerformedSession, PerformedSession, QSortBy> {
  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      sortByPerformedSessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedSessionId', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      sortByPerformedSessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedSessionId', Sort.desc);
    });
  }
}

extension PerformedSessionQuerySortThenBy
    on QueryBuilder<PerformedSession, PerformedSession, QSortThenBy> {
  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByPerformedSessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedSessionId', Sort.asc);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QAfterSortBy>
      thenByPerformedSessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedSessionId', Sort.desc);
    });
  }
}

extension PerformedSessionQueryWhereDistinct
    on QueryBuilder<PerformedSession, PerformedSession, QDistinct> {
  QueryBuilder<PerformedSession, PerformedSession, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QDistinct>
      distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformedSession, PerformedSession, QDistinct>
      distinctByPerformedSessionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performedSessionId',
          caseSensitive: caseSensitive);
    });
  }
}

extension PerformedSessionQueryProperty
    on QueryBuilder<PerformedSession, PerformedSession, QQueryProperty> {
  QueryBuilder<PerformedSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerformedSession, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PerformedSession, DateTime?, QQueryOperations>
      endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<PerformedSession, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<PerformedSession, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PerformedSession, String, QQueryOperations>
      performedSessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performedSessionId');
    });
  }
}
