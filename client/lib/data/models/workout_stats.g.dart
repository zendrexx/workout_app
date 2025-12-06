// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_stats.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutStatsCollection on Isar {
  IsarCollection<WorkoutStats> get workoutStats => this.collection();
}

const WorkoutStatsSchema = CollectionSchema(
  name: r'WorkoutStats',
  id: -5887317709925367729,
  properties: {
    r'hours': PropertySchema(
      id: 0,
      name: r'hours',
      type: IsarType.long,
    ),
    r'minutes': PropertySchema(
      id: 1,
      name: r'minutes',
      type: IsarType.long,
    ),
    r'seconds': PropertySchema(
      id: 2,
      name: r'seconds',
      type: IsarType.long,
    ),
    r'tempTotalSets': PropertySchema(
      id: 3,
      name: r'tempTotalSets',
      type: IsarType.long,
    ),
    r'tempTotalVolume': PropertySchema(
      id: 4,
      name: r'tempTotalVolume',
      type: IsarType.double,
    )
  },
  estimateSize: _workoutStatsEstimateSize,
  serialize: _workoutStatsSerialize,
  deserialize: _workoutStatsDeserialize,
  deserializeProp: _workoutStatsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _workoutStatsGetId,
  getLinks: _workoutStatsGetLinks,
  attach: _workoutStatsAttach,
  version: '3.1.0+1',
);

int _workoutStatsEstimateSize(
  WorkoutStats object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _workoutStatsSerialize(
  WorkoutStats object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hours);
  writer.writeLong(offsets[1], object.minutes);
  writer.writeLong(offsets[2], object.seconds);
  writer.writeLong(offsets[3], object.tempTotalSets);
  writer.writeDouble(offsets[4], object.tempTotalVolume);
}

WorkoutStats _workoutStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutStats(
    hours: reader.readLongOrNull(offsets[0]),
    minutes: reader.readLongOrNull(offsets[1]),
    seconds: reader.readLongOrNull(offsets[2]),
    tempTotalSets: reader.readLongOrNull(offsets[3]),
    tempTotalVolume: reader.readDoubleOrNull(offsets[4]),
  );
  object.id = id;
  return object;
}

P _workoutStatsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutStatsGetId(WorkoutStats object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutStatsGetLinks(WorkoutStats object) {
  return [];
}

void _workoutStatsAttach(
    IsarCollection<dynamic> col, Id id, WorkoutStats object) {
  object.id = id;
}

extension WorkoutStatsQueryWhereSort
    on QueryBuilder<WorkoutStats, WorkoutStats, QWhere> {
  QueryBuilder<WorkoutStats, WorkoutStats, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutStatsQueryWhere
    on QueryBuilder<WorkoutStats, WorkoutStats, QWhereClause> {
  QueryBuilder<WorkoutStats, WorkoutStats, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterWhereClause> idBetween(
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

extension WorkoutStatsQueryFilter
    on QueryBuilder<WorkoutStats, WorkoutStats, QFilterCondition> {
  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      hoursIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hours',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      hoursIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hours',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition> hoursEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hours',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      hoursGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hours',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition> hoursLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hours',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition> hoursBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      minutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minutes',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      minutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minutes',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      minutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minutes',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      minutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minutes',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      minutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minutes',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      minutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      secondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'seconds',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      secondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'seconds',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      secondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seconds',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      secondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seconds',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      secondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seconds',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      secondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalSetsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tempTotalSets',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalSetsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tempTotalSets',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalSetsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tempTotalSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalSetsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tempTotalSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalSetsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tempTotalSets',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalSetsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tempTotalSets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalVolumeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tempTotalVolume',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalVolumeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tempTotalVolume',
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalVolumeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tempTotalVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalVolumeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tempTotalVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalVolumeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tempTotalVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterFilterCondition>
      tempTotalVolumeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tempTotalVolume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension WorkoutStatsQueryObject
    on QueryBuilder<WorkoutStats, WorkoutStats, QFilterCondition> {}

extension WorkoutStatsQueryLinks
    on QueryBuilder<WorkoutStats, WorkoutStats, QFilterCondition> {}

extension WorkoutStatsQuerySortBy
    on QueryBuilder<WorkoutStats, WorkoutStats, QSortBy> {
  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> sortByHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> sortByHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> sortByMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> sortByMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> sortBySeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconds', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> sortBySecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconds', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> sortByTempTotalSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempTotalSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy>
      sortByTempTotalSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempTotalSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy>
      sortByTempTotalVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempTotalVolume', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy>
      sortByTempTotalVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempTotalVolume', Sort.desc);
    });
  }
}

extension WorkoutStatsQuerySortThenBy
    on QueryBuilder<WorkoutStats, WorkoutStats, QSortThenBy> {
  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> thenByHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> thenByHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hours', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> thenByMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> thenByMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutes', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> thenBySeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconds', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> thenBySecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seconds', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy> thenByTempTotalSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempTotalSets', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy>
      thenByTempTotalSetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempTotalSets', Sort.desc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy>
      thenByTempTotalVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempTotalVolume', Sort.asc);
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QAfterSortBy>
      thenByTempTotalVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tempTotalVolume', Sort.desc);
    });
  }
}

extension WorkoutStatsQueryWhereDistinct
    on QueryBuilder<WorkoutStats, WorkoutStats, QDistinct> {
  QueryBuilder<WorkoutStats, WorkoutStats, QDistinct> distinctByHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hours');
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QDistinct> distinctByMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minutes');
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QDistinct> distinctBySeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seconds');
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QDistinct>
      distinctByTempTotalSets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tempTotalSets');
    });
  }

  QueryBuilder<WorkoutStats, WorkoutStats, QDistinct>
      distinctByTempTotalVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tempTotalVolume');
    });
  }
}

extension WorkoutStatsQueryProperty
    on QueryBuilder<WorkoutStats, WorkoutStats, QQueryProperty> {
  QueryBuilder<WorkoutStats, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutStats, int?, QQueryOperations> hoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hours');
    });
  }

  QueryBuilder<WorkoutStats, int?, QQueryOperations> minutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minutes');
    });
  }

  QueryBuilder<WorkoutStats, int?, QQueryOperations> secondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seconds');
    });
  }

  QueryBuilder<WorkoutStats, int?, QQueryOperations> tempTotalSetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tempTotalSets');
    });
  }

  QueryBuilder<WorkoutStats, double?, QQueryOperations>
      tempTotalVolumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tempTotalVolume');
    });
  }
}
