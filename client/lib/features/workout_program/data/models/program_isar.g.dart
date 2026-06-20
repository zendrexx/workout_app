// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProgramIsarCollection on Isar {
  IsarCollection<ProgramIsar> get programIsars => this.collection();
}

const ProgramIsarSchema = CollectionSchema(
  name: r'ProgramIsar',
  id: -7994856263276764150,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'programId': PropertySchema(
      id: 1,
      name: r'programId',
      type: IsarType.string,
    ),
    r'weeks': PropertySchema(
      id: 2,
      name: r'weeks',
      type: IsarType.objectList,
      target: r'ProgramWeekIsar',
    )
  },
  estimateSize: _programIsarEstimateSize,
  serialize: _programIsarSerialize,
  deserialize: _programIsarDeserialize,
  deserializeProp: _programIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'programId': IndexSchema(
      id: 8658639611369428834,
      name: r'programId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'programId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'ProgramWeekIsar': ProgramWeekIsarSchema},
  getId: _programIsarGetId,
  getLinks: _programIsarGetLinks,
  attach: _programIsarAttach,
  version: '3.1.0+1',
);

int _programIsarEstimateSize(
  ProgramIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.programId.length * 3;
  bytesCount += 3 + object.weeks.length * 3;
  {
    final offsets = allOffsets[ProgramWeekIsar]!;
    for (var i = 0; i < object.weeks.length; i++) {
      final value = object.weeks[i];
      bytesCount +=
          ProgramWeekIsarSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _programIsarSerialize(
  ProgramIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.programId);
  writer.writeObjectList<ProgramWeekIsar>(
    offsets[2],
    allOffsets,
    ProgramWeekIsarSchema.serialize,
    object.weeks,
  );
}

ProgramIsar _programIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProgramIsar(
    name: reader.readString(offsets[0]),
    programId: reader.readString(offsets[1]),
  );
  object.id = id;
  object.weeks = reader.readObjectList<ProgramWeekIsar>(
        offsets[2],
        ProgramWeekIsarSchema.deserialize,
        allOffsets,
        ProgramWeekIsar(),
      ) ??
      [];
  return object;
}

P _programIsarDeserializeProp<P>(
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
      return (reader.readObjectList<ProgramWeekIsar>(
            offset,
            ProgramWeekIsarSchema.deserialize,
            allOffsets,
            ProgramWeekIsar(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _programIsarGetId(ProgramIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _programIsarGetLinks(ProgramIsar object) {
  return [];
}

void _programIsarAttach(
    IsarCollection<dynamic> col, Id id, ProgramIsar object) {
  object.id = id;
}

extension ProgramIsarByIndex on IsarCollection<ProgramIsar> {
  Future<ProgramIsar?> getByProgramId(String programId) {
    return getByIndex(r'programId', [programId]);
  }

  ProgramIsar? getByProgramIdSync(String programId) {
    return getByIndexSync(r'programId', [programId]);
  }

  Future<bool> deleteByProgramId(String programId) {
    return deleteByIndex(r'programId', [programId]);
  }

  bool deleteByProgramIdSync(String programId) {
    return deleteByIndexSync(r'programId', [programId]);
  }

  Future<List<ProgramIsar?>> getAllByProgramId(List<String> programIdValues) {
    final values = programIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'programId', values);
  }

  List<ProgramIsar?> getAllByProgramIdSync(List<String> programIdValues) {
    final values = programIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'programId', values);
  }

  Future<int> deleteAllByProgramId(List<String> programIdValues) {
    final values = programIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'programId', values);
  }

  int deleteAllByProgramIdSync(List<String> programIdValues) {
    final values = programIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'programId', values);
  }

  Future<Id> putByProgramId(ProgramIsar object) {
    return putByIndex(r'programId', object);
  }

  Id putByProgramIdSync(ProgramIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'programId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByProgramId(List<ProgramIsar> objects) {
    return putAllByIndex(r'programId', objects);
  }

  List<Id> putAllByProgramIdSync(List<ProgramIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'programId', objects, saveLinks: saveLinks);
  }
}

extension ProgramIsarQueryWhereSort
    on QueryBuilder<ProgramIsar, ProgramIsar, QWhere> {
  QueryBuilder<ProgramIsar, ProgramIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProgramIsarQueryWhere
    on QueryBuilder<ProgramIsar, ProgramIsar, QWhereClause> {
  QueryBuilder<ProgramIsar, ProgramIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterWhereClause> programIdEqualTo(
      String programId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'programId',
        value: [programId],
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterWhereClause> programIdNotEqualTo(
      String programId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'programId',
              lower: [],
              upper: [programId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'programId',
              lower: [programId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'programId',
              lower: [programId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'programId',
              lower: [],
              upper: [programId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ProgramIsarQueryFilter
    on QueryBuilder<ProgramIsar, ProgramIsar, QFilterCondition> {
  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> nameContains(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'programId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'programId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'programId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'programId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'programId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'programId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'programId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'programId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'programId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      programIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'programId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      weeksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weeks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> weeksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weeks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      weeksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weeks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      weeksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weeks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      weeksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weeks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition>
      weeksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weeks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ProgramIsarQueryObject
    on QueryBuilder<ProgramIsar, ProgramIsar, QFilterCondition> {
  QueryBuilder<ProgramIsar, ProgramIsar, QAfterFilterCondition> weeksElement(
      FilterQuery<ProgramWeekIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weeks');
    });
  }
}

extension ProgramIsarQueryLinks
    on QueryBuilder<ProgramIsar, ProgramIsar, QFilterCondition> {}

extension ProgramIsarQuerySortBy
    on QueryBuilder<ProgramIsar, ProgramIsar, QSortBy> {
  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> sortByProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programId', Sort.asc);
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> sortByProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programId', Sort.desc);
    });
  }
}

extension ProgramIsarQuerySortThenBy
    on QueryBuilder<ProgramIsar, ProgramIsar, QSortThenBy> {
  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> thenByProgramId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programId', Sort.asc);
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QAfterSortBy> thenByProgramIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programId', Sort.desc);
    });
  }
}

extension ProgramIsarQueryWhereDistinct
    on QueryBuilder<ProgramIsar, ProgramIsar, QDistinct> {
  QueryBuilder<ProgramIsar, ProgramIsar, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProgramIsar, ProgramIsar, QDistinct> distinctByProgramId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'programId', caseSensitive: caseSensitive);
    });
  }
}

extension ProgramIsarQueryProperty
    on QueryBuilder<ProgramIsar, ProgramIsar, QQueryProperty> {
  QueryBuilder<ProgramIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProgramIsar, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ProgramIsar, String, QQueryOperations> programIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'programId');
    });
  }

  QueryBuilder<ProgramIsar, List<ProgramWeekIsar>, QQueryOperations>
      weeksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weeks');
    });
  }
}
