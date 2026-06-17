// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_week_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProgramWeekIsarCollection on Isar {
  IsarCollection<ProgramWeekIsar> get programWeekIsars => this.collection();
}

const ProgramWeekIsarSchema = CollectionSchema(
  name: r'ProgramWeekIsar',
  id: -6072934678512853471,
  properties: {
    r'weekId': PropertySchema(
      id: 0,
      name: r'weekId',
      type: IsarType.string,
    ),
    r'weekNumber': PropertySchema(
      id: 1,
      name: r'weekNumber',
      type: IsarType.long,
    )
  },
  estimateSize: _programWeekIsarEstimateSize,
  serialize: _programWeekIsarSerialize,
  deserialize: _programWeekIsarDeserialize,
  deserializeProp: _programWeekIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'weekId': IndexSchema(
      id: -3153186374818652656,
      name: r'weekId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'weekId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'sessions': LinkSchema(
      id: 2380176509321114196,
      name: r'sessions',
      target: r'PlannedSessionIsar',
      single: false,
    ),
    r'program': LinkSchema(
      id: 6439292100273905881,
      name: r'program',
      target: r'ProgramIsar',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _programWeekIsarGetId,
  getLinks: _programWeekIsarGetLinks,
  attach: _programWeekIsarAttach,
  version: '3.1.0+1',
);

int _programWeekIsarEstimateSize(
  ProgramWeekIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.weekId.length * 3;
  return bytesCount;
}

void _programWeekIsarSerialize(
  ProgramWeekIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.weekId);
  writer.writeLong(offsets[1], object.weekNumber);
}

ProgramWeekIsar _programWeekIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProgramWeekIsar(
    weekId: reader.readString(offsets[0]),
    weekNumber: reader.readLong(offsets[1]),
  );
  object.id = id;
  return object;
}

P _programWeekIsarDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _programWeekIsarGetId(ProgramWeekIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _programWeekIsarGetLinks(ProgramWeekIsar object) {
  return [object.sessions, object.program];
}

void _programWeekIsarAttach(
    IsarCollection<dynamic> col, Id id, ProgramWeekIsar object) {
  object.id = id;
  object.sessions
      .attach(col, col.isar.collection<PlannedSessionIsar>(), r'sessions', id);
  object.program
      .attach(col, col.isar.collection<ProgramIsar>(), r'program', id);
}

extension ProgramWeekIsarByIndex on IsarCollection<ProgramWeekIsar> {
  Future<ProgramWeekIsar?> getByWeekId(String weekId) {
    return getByIndex(r'weekId', [weekId]);
  }

  ProgramWeekIsar? getByWeekIdSync(String weekId) {
    return getByIndexSync(r'weekId', [weekId]);
  }

  Future<bool> deleteByWeekId(String weekId) {
    return deleteByIndex(r'weekId', [weekId]);
  }

  bool deleteByWeekIdSync(String weekId) {
    return deleteByIndexSync(r'weekId', [weekId]);
  }

  Future<List<ProgramWeekIsar?>> getAllByWeekId(List<String> weekIdValues) {
    final values = weekIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'weekId', values);
  }

  List<ProgramWeekIsar?> getAllByWeekIdSync(List<String> weekIdValues) {
    final values = weekIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'weekId', values);
  }

  Future<int> deleteAllByWeekId(List<String> weekIdValues) {
    final values = weekIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'weekId', values);
  }

  int deleteAllByWeekIdSync(List<String> weekIdValues) {
    final values = weekIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'weekId', values);
  }

  Future<Id> putByWeekId(ProgramWeekIsar object) {
    return putByIndex(r'weekId', object);
  }

  Id putByWeekIdSync(ProgramWeekIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'weekId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByWeekId(List<ProgramWeekIsar> objects) {
    return putAllByIndex(r'weekId', objects);
  }

  List<Id> putAllByWeekIdSync(List<ProgramWeekIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'weekId', objects, saveLinks: saveLinks);
  }
}

extension ProgramWeekIsarQueryWhereSort
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QWhere> {
  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProgramWeekIsarQueryWhere
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QWhereClause> {
  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterWhereClause>
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

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterWhereClause>
      weekIdEqualTo(String weekId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'weekId',
        value: [weekId],
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterWhereClause>
      weekIdNotEqualTo(String weekId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekId',
              lower: [],
              upper: [weekId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekId',
              lower: [weekId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekId',
              lower: [weekId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'weekId',
              lower: [],
              upper: [weekId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ProgramWeekIsarQueryFilter
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QFilterCondition> {
  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
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

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
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

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
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

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weekId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weekId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weekId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weekId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weekId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      weekNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProgramWeekIsarQueryObject
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QFilterCondition> {}

extension ProgramWeekIsarQueryLinks
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QFilterCondition> {
  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessions(FilterQuery<PlannedSessionIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'sessions');
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sessions', length, true, length, true);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sessions', 0, true, 0, true);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sessions', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sessions', 0, true, length, include);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sessions', length, include, 999999, true);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'sessions', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition> program(
      FilterQuery<ProgramIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'program');
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      programIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'program', 0, true, 0, true);
    });
  }
}

extension ProgramWeekIsarQuerySortBy
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QSortBy> {
  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy> sortByWeekId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekId', Sort.asc);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy>
      sortByWeekIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekId', Sort.desc);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy>
      sortByWeekNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekNumber', Sort.asc);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy>
      sortByWeekNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekNumber', Sort.desc);
    });
  }
}

extension ProgramWeekIsarQuerySortThenBy
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QSortThenBy> {
  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy> thenByWeekId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekId', Sort.asc);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy>
      thenByWeekIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekId', Sort.desc);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy>
      thenByWeekNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekNumber', Sort.asc);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterSortBy>
      thenByWeekNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekNumber', Sort.desc);
    });
  }
}

extension ProgramWeekIsarQueryWhereDistinct
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QDistinct> {
  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QDistinct> distinctByWeekId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QDistinct>
      distinctByWeekNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekNumber');
    });
  }
}

extension ProgramWeekIsarQueryProperty
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QQueryProperty> {
  QueryBuilder<ProgramWeekIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProgramWeekIsar, String, QQueryOperations> weekIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekId');
    });
  }

  QueryBuilder<ProgramWeekIsar, int, QQueryOperations> weekNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekNumber');
    });
  }
}
