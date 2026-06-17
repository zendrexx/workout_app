// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_program_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActiveProgramIsarCollection on Isar {
  IsarCollection<ActiveProgramIsar> get activeProgramIsars => this.collection();
}

const ActiveProgramIsarSchema = CollectionSchema(
  name: r'ActiveProgramIsar',
  id: -2399752870737630535,
  properties: {
    r'activeProgramId': PropertySchema(
      id: 0,
      name: r'activeProgramId',
      type: IsarType.string,
    ),
    r'currentDay': PropertySchema(
      id: 1,
      name: r'currentDay',
      type: IsarType.long,
    ),
    r'currentWeek': PropertySchema(
      id: 2,
      name: r'currentWeek',
      type: IsarType.long,
    ),
    r'isCompleted': PropertySchema(
      id: 3,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'startedAt': PropertySchema(
      id: 4,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'templateProgramId': PropertySchema(
      id: 5,
      name: r'templateProgramId',
      type: IsarType.string,
    )
  },
  estimateSize: _activeProgramIsarEstimateSize,
  serialize: _activeProgramIsarSerialize,
  deserialize: _activeProgramIsarDeserialize,
  deserializeProp: _activeProgramIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'activeProgramId': IndexSchema(
      id: 7667102515735309560,
      name: r'activeProgramId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'activeProgramId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _activeProgramIsarGetId,
  getLinks: _activeProgramIsarGetLinks,
  attach: _activeProgramIsarAttach,
  version: '3.1.0+1',
);

int _activeProgramIsarEstimateSize(
  ActiveProgramIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeProgramId.length * 3;
  bytesCount += 3 + object.templateProgramId.length * 3;
  return bytesCount;
}

void _activeProgramIsarSerialize(
  ActiveProgramIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activeProgramId);
  writer.writeLong(offsets[1], object.currentDay);
  writer.writeLong(offsets[2], object.currentWeek);
  writer.writeBool(offsets[3], object.isCompleted);
  writer.writeDateTime(offsets[4], object.startedAt);
  writer.writeString(offsets[5], object.templateProgramId);
}

ActiveProgramIsar _activeProgramIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ActiveProgramIsar(
    activeProgramId: reader.readString(offsets[0]),
    currentDay: reader.readLong(offsets[1]),
    currentWeek: reader.readLong(offsets[2]),
    isCompleted: reader.readBoolOrNull(offsets[3]) ?? false,
    startedAt: reader.readDateTime(offsets[4]),
    templateProgramId: reader.readString(offsets[5]),
  );
  object.id = id;
  return object;
}

P _activeProgramIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _activeProgramIsarGetId(ActiveProgramIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _activeProgramIsarGetLinks(
    ActiveProgramIsar object) {
  return [];
}

void _activeProgramIsarAttach(
    IsarCollection<dynamic> col, Id id, ActiveProgramIsar object) {
  object.id = id;
}

extension ActiveProgramIsarByIndex on IsarCollection<ActiveProgramIsar> {
  Future<ActiveProgramIsar?> getByActiveProgramId(String activeProgramId) {
    return getByIndex(r'activeProgramId', [activeProgramId]);
  }

  ActiveProgramIsar? getByActiveProgramIdSync(String activeProgramId) {
    return getByIndexSync(r'activeProgramId', [activeProgramId]);
  }

  Future<bool> deleteByActiveProgramId(String activeProgramId) {
    return deleteByIndex(r'activeProgramId', [activeProgramId]);
  }

  bool deleteByActiveProgramIdSync(String activeProgramId) {
    return deleteByIndexSync(r'activeProgramId', [activeProgramId]);
  }

  Future<List<ActiveProgramIsar?>> getAllByActiveProgramId(
      List<String> activeProgramIdValues) {
    final values = activeProgramIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'activeProgramId', values);
  }

  List<ActiveProgramIsar?> getAllByActiveProgramIdSync(
      List<String> activeProgramIdValues) {
    final values = activeProgramIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'activeProgramId', values);
  }

  Future<int> deleteAllByActiveProgramId(List<String> activeProgramIdValues) {
    final values = activeProgramIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'activeProgramId', values);
  }

  int deleteAllByActiveProgramIdSync(List<String> activeProgramIdValues) {
    final values = activeProgramIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'activeProgramId', values);
  }

  Future<Id> putByActiveProgramId(ActiveProgramIsar object) {
    return putByIndex(r'activeProgramId', object);
  }

  Id putByActiveProgramIdSync(ActiveProgramIsar object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'activeProgramId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByActiveProgramId(List<ActiveProgramIsar> objects) {
    return putAllByIndex(r'activeProgramId', objects);
  }

  List<Id> putAllByActiveProgramIdSync(List<ActiveProgramIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'activeProgramId', objects, saveLinks: saveLinks);
  }
}

extension ActiveProgramIsarQueryWhereSort
    on QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QWhere> {
  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ActiveProgramIsarQueryWhere
    on QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QWhereClause> {
  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterWhereClause>
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

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterWhereClause>
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

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterWhereClause>
      activeProgramIdEqualTo(String activeProgramId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'activeProgramId',
        value: [activeProgramId],
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterWhereClause>
      activeProgramIdNotEqualTo(String activeProgramId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activeProgramId',
              lower: [],
              upper: [activeProgramId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activeProgramId',
              lower: [activeProgramId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activeProgramId',
              lower: [activeProgramId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'activeProgramId',
              lower: [],
              upper: [activeProgramId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ActiveProgramIsarQueryFilter
    on QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QFilterCondition> {
  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeProgramId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeProgramId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeProgramId',
        value: '',
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      activeProgramIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeProgramId',
        value: '',
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      currentDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentDay',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      currentDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentDay',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      currentDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentDay',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      currentDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      currentWeekEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      currentWeekGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      currentWeekLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      currentWeekBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
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

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
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

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
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

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      startedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      startedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'templateProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'templateProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'templateProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'templateProgramId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'templateProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'templateProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'templateProgramId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'templateProgramId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'templateProgramId',
        value: '',
      ));
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterFilterCondition>
      templateProgramIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'templateProgramId',
        value: '',
      ));
    });
  }
}

extension ActiveProgramIsarQueryObject
    on QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QFilterCondition> {}

extension ActiveProgramIsarQueryLinks
    on QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QFilterCondition> {}

extension ActiveProgramIsarQuerySortBy
    on QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QSortBy> {
  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByActiveProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeProgramId', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByActiveProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeProgramId', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByCurrentDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDay', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByCurrentDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDay', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByCurrentWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWeek', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByCurrentWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWeek', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByTemplateProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateProgramId', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      sortByTemplateProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateProgramId', Sort.desc);
    });
  }
}

extension ActiveProgramIsarQuerySortThenBy
    on QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QSortThenBy> {
  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByActiveProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeProgramId', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByActiveProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeProgramId', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByCurrentDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDay', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByCurrentDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDay', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByCurrentWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWeek', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByCurrentWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWeek', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByTemplateProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateProgramId', Sort.asc);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QAfterSortBy>
      thenByTemplateProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateProgramId', Sort.desc);
    });
  }
}

extension ActiveProgramIsarQueryWhereDistinct
    on QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QDistinct> {
  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QDistinct>
      distinctByActiveProgramId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeProgramId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QDistinct>
      distinctByCurrentDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentDay');
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QDistinct>
      distinctByCurrentWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentWeek');
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QDistinct>
      distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QDistinct>
      distinctByTemplateProgramId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'templateProgramId',
          caseSensitive: caseSensitive);
    });
  }
}

extension ActiveProgramIsarQueryProperty
    on QueryBuilder<ActiveProgramIsar, ActiveProgramIsar, QQueryProperty> {
  QueryBuilder<ActiveProgramIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ActiveProgramIsar, String, QQueryOperations>
      activeProgramIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeProgramId');
    });
  }

  QueryBuilder<ActiveProgramIsar, int, QQueryOperations> currentDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentDay');
    });
  }

  QueryBuilder<ActiveProgramIsar, int, QQueryOperations> currentWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentWeek');
    });
  }

  QueryBuilder<ActiveProgramIsar, bool, QQueryOperations>
      isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<ActiveProgramIsar, DateTime, QQueryOperations>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<ActiveProgramIsar, String, QQueryOperations>
      templateProgramIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'templateProgramId');
    });
  }
}
