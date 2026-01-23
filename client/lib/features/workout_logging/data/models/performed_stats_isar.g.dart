// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performed_stats_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPerformedStatsIsarCollection on Isar {
  IsarCollection<PerformedStatsIsar> get performedStatsIsars =>
      this.collection();
}

const PerformedStatsIsarSchema = CollectionSchema(
  name: r'PerformedStatsIsar',
  id: 1272274147882291497,
  properties: {
    r'totalSeconds': PropertySchema(
      id: 0,
      name: r'totalSeconds',
      type: IsarType.long,
    ),
    r'totalSets': PropertySchema(
      id: 1,
      name: r'totalSets',
      type: IsarType.long,
    ),
    r'totalVolume': PropertySchema(
      id: 2,
      name: r'totalVolume',
      type: IsarType.double,
    )
  },
  estimateSize: _performedStatsIsarEstimateSize,
  serialize: _performedStatsIsarSerialize,
  deserialize: _performedStatsIsarDeserialize,
  deserializeProp: _performedStatsIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _performedStatsIsarGetId,
  getLinks: _performedStatsIsarGetLinks,
  attach: _performedStatsIsarAttach,
  version: '3.1.0+1',
);

int _performedStatsIsarEstimateSize(
  PerformedStatsIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _performedStatsIsarSerialize(
  PerformedStatsIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.totalSeconds);
  writer.writeLong(offsets[1], object.totalSets);
  writer.writeDouble(offsets[2], object.totalVolume);
}

PerformedStatsIsar _performedStatsIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerformedStatsIsar();
  object.id = id;
  object.totalSeconds = reader.readLong(offsets[0]);
  object.totalSets = reader.readLong(offsets[1]);
  object.totalVolume = reader.readDouble(offsets[2]);
  return object;
}

P _performedStatsIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _performedStatsIsarGetId(PerformedStatsIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _performedStatsIsarGetLinks(
    PerformedStatsIsar object) {
  return [];
}

void _performedStatsIsarAttach(
    IsarCollection<dynamic> col, Id id, PerformedStatsIsar object) {
  object.id = id;
}

extension PerformedStatsIsarQueryWhereSort
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QWhere> {
  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PerformedStatsIsarQueryWhere
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QWhereClause> {
  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterWhereClause>
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

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterWhereClause>
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

extension PerformedStatsIsarQueryFilter
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QFilterCondition> {
  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalSetsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSets',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalSetsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSets',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalSetsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSets',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalSetsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalVolumeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalVolumeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalVolumeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterFilterCondition>
      totalVolumeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalVolume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PerformedStatsIsarQueryObject
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QFilterCondition> {}

extension PerformedStatsIsarQueryLinks
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QFilterCondition> {}

extension PerformedStatsIsarQuerySortBy
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QSortBy> {
  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      sortByTotalSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeconds', Sort.asc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      sortByTotalSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeconds', Sort.desc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      sortByTotalSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSets', Sort.asc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      sortByTotalSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSets', Sort.desc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      sortByTotalVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolume', Sort.asc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      sortByTotalVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolume', Sort.desc);
    });
  }
}

extension PerformedStatsIsarQuerySortThenBy
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QSortThenBy> {
  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      thenByTotalSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeconds', Sort.asc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      thenByTotalSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeconds', Sort.desc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      thenByTotalSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSets', Sort.asc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      thenByTotalSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSets', Sort.desc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      thenByTotalVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolume', Sort.asc);
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QAfterSortBy>
      thenByTotalVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolume', Sort.desc);
    });
  }
}

extension PerformedStatsIsarQueryWhereDistinct
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QDistinct> {
  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QDistinct>
      distinctByTotalSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSeconds');
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QDistinct>
      distinctByTotalSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSets');
    });
  }

  QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QDistinct>
      distinctByTotalVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalVolume');
    });
  }
}

extension PerformedStatsIsarQueryProperty
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QQueryProperty> {
  QueryBuilder<PerformedStatsIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerformedStatsIsar, int, QQueryOperations>
      totalSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSeconds');
    });
  }

  QueryBuilder<PerformedStatsIsar, int, QQueryOperations> totalSetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSets');
    });
  }

  QueryBuilder<PerformedStatsIsar, double, QQueryOperations>
      totalVolumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalVolume');
    });
  }
}
