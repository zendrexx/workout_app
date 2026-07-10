// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_set_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlannedSetIsarSchema = Schema(
  name: r'PlannedSetIsar',
  id: -8044381193899721445,
  properties: {
    r'estWeight': PropertySchema(
      id: 0,
      name: r'estWeight',
      type: IsarType.double,
    ),
    r'maxRep': PropertySchema(
      id: 1,
      name: r'maxRep',
      type: IsarType.long,
    ),
    r'minRep': PropertySchema(
      id: 2,
      name: r'minRep',
      type: IsarType.long,
    ),
    r'targetPercentage': PropertySchema(
      id: 3,
      name: r'targetPercentage',
      type: IsarType.double,
    )
  },
  estimateSize: _plannedSetIsarEstimateSize,
  serialize: _plannedSetIsarSerialize,
  deserialize: _plannedSetIsarDeserialize,
  deserializeProp: _plannedSetIsarDeserializeProp,
);

int _plannedSetIsarEstimateSize(
  PlannedSetIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _plannedSetIsarSerialize(
  PlannedSetIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.estWeight);
  writer.writeLong(offsets[1], object.maxRep);
  writer.writeLong(offsets[2], object.minRep);
  writer.writeDouble(offsets[3], object.targetPercentage);
}

PlannedSetIsar _plannedSetIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlannedSetIsar(
    estWeight: reader.readDoubleOrNull(offsets[0]),
    maxRep: reader.readLongOrNull(offsets[1]),
    minRep: reader.readLongOrNull(offsets[2]),
  );
  object.targetPercentage = reader.readDoubleOrNull(offsets[3]);
  return object;
}

P _plannedSetIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlannedSetIsarQueryFilter
    on QueryBuilder<PlannedSetIsar, PlannedSetIsar, QFilterCondition> {
  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      estWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estWeight',
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      estWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estWeight',
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      estWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      estWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      estWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      estWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      maxRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxRep',
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      maxRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxRep',
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      maxRepEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      maxRepGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      maxRepLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      maxRepBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxRep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      minRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minRep',
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      minRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minRep',
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      minRepEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      minRepGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      minRepLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      minRepBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minRep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      targetPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetPercentage',
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      targetPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetPercentage',
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      targetPercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      targetPercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      targetPercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlannedSetIsar, PlannedSetIsar, QAfterFilterCondition>
      targetPercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PlannedSetIsarQueryObject
    on QueryBuilder<PlannedSetIsar, PlannedSetIsar, QFilterCondition> {}
