// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performed_stats_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PerformedStatsIsarSchema = Schema(
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
  final object = PerformedStatsIsar(
    totalSeconds: reader.readLongOrNull(offsets[0]) ?? 0,
    totalSets: reader.readLongOrNull(offsets[1]) ?? 0,
    totalVolume: reader.readDoubleOrNull(offsets[2]) ?? 0.0,
  );
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
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PerformedStatsIsarQueryFilter
    on QueryBuilder<PerformedStatsIsar, PerformedStatsIsar, QFilterCondition> {
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
