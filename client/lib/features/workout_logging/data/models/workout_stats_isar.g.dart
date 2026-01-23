// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_stats_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutStatsIsarCollection on Isar {
  IsarCollection<WorkoutStatsIsar> get workoutStatsIsars => this.collection();
}

const WorkoutStatsIsarSchema = CollectionSchema(
  name: r'WorkoutStatsIsar',
  id: 4527957561526536817,
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
  estimateSize: _workoutStatsIsarEstimateSize,
  serialize: _workoutStatsIsarSerialize,
  deserialize: _workoutStatsIsarDeserialize,
  deserializeProp: _workoutStatsIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _workoutStatsIsarGetId,
  getLinks: _workoutStatsIsarGetLinks,
  attach: _workoutStatsIsarAttach,
  version: '3.1.0+1',
);

int _workoutStatsIsarEstimateSize(
  WorkoutStatsIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _workoutStatsIsarSerialize(
  WorkoutStatsIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.totalSeconds);
  writer.writeLong(offsets[1], object.totalSets);
  writer.writeDouble(offsets[2], object.totalVolume);
}

WorkoutStatsIsar _workoutStatsIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutStatsIsar();
  object.id = id;
  object.totalSeconds = reader.readLong(offsets[0]);
  object.totalSets = reader.readLong(offsets[1]);
  object.totalVolume = reader.readDouble(offsets[2]);
  return object;
}

P _workoutStatsIsarDeserializeProp<P>(
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

Id _workoutStatsIsarGetId(WorkoutStatsIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutStatsIsarGetLinks(WorkoutStatsIsar object) {
  return [];
}

void _workoutStatsIsarAttach(
    IsarCollection<dynamic> col, Id id, WorkoutStatsIsar object) {
  object.id = id;
}

extension WorkoutStatsIsarQueryWhereSort
    on QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QWhere> {
  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutStatsIsarQueryWhere
    on QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QWhereClause> {
  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterWhereClause>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterWhereClause> idBetween(
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

extension WorkoutStatsIsarQueryFilter
    on QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QFilterCondition> {
  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
      totalSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
      totalSetsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterFilterCondition>
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

extension WorkoutStatsIsarQueryObject
    on QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QFilterCondition> {}

extension WorkoutStatsIsarQueryLinks
    on QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QFilterCondition> {}

extension WorkoutStatsIsarQuerySortBy
    on QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QSortBy> {
  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      sortByTotalSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeconds', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      sortByTotalSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeconds', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      sortByTotalSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      sortByTotalSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      sortByTotalVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolume', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      sortByTotalVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolume', Sort.desc);
    });
  }
}

extension WorkoutStatsIsarQuerySortThenBy
    on QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QSortThenBy> {
  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      thenByTotalSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeconds', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      thenByTotalSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSeconds', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      thenByTotalSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      thenByTotalSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      thenByTotalVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolume', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QAfterSortBy>
      thenByTotalVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalVolume', Sort.desc);
    });
  }
}

extension WorkoutStatsIsarQueryWhereDistinct
    on QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QDistinct> {
  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QDistinct>
      distinctByTotalSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSeconds');
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QDistinct>
      distinctByTotalSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSets');
    });
  }

  QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QDistinct>
      distinctByTotalVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalVolume');
    });
  }
}

extension WorkoutStatsIsarQueryProperty
    on QueryBuilder<WorkoutStatsIsar, WorkoutStatsIsar, QQueryProperty> {
  QueryBuilder<WorkoutStatsIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutStatsIsar, int, QQueryOperations> totalSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSeconds');
    });
  }

  QueryBuilder<WorkoutStatsIsar, int, QQueryOperations> totalSetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSets');
    });
  }

  QueryBuilder<WorkoutStatsIsar, double, QQueryOperations>
      totalVolumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalVolume');
    });
  }
}
