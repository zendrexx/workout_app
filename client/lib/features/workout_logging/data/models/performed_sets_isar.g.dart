// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performed_sets_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PerformedSetsIsarSchema = Schema(
  name: r'PerformedSetsIsar',
  id: 5878546394417608408,
  properties: {
    r'actWeight': PropertySchema(
      id: 0,
      name: r'actWeight',
      type: IsarType.double,
    ),
    r'actualRep': PropertySchema(
      id: 1,
      name: r'actualRep',
      type: IsarType.long,
    ),
    r'estRep': PropertySchema(
      id: 2,
      name: r'estRep',
      type: IsarType.string,
    ),
    r'estWeight': PropertySchema(
      id: 3,
      name: r'estWeight',
      type: IsarType.double,
    ),
    r'isCompleted': PropertySchema(
      id: 4,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'rpe': PropertySchema(
      id: 5,
      name: r'rpe',
      type: IsarType.double,
    )
  },
  estimateSize: _performedSetsIsarEstimateSize,
  serialize: _performedSetsIsarSerialize,
  deserialize: _performedSetsIsarDeserialize,
  deserializeProp: _performedSetsIsarDeserializeProp,
);

int _performedSetsIsarEstimateSize(
  PerformedSetsIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.estRep;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _performedSetsIsarSerialize(
  PerformedSetsIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.actWeight);
  writer.writeLong(offsets[1], object.actualRep);
  writer.writeString(offsets[2], object.estRep);
  writer.writeDouble(offsets[3], object.estWeight);
  writer.writeBool(offsets[4], object.isCompleted);
  writer.writeDouble(offsets[5], object.rpe);
}

PerformedSetsIsar _performedSetsIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerformedSetsIsar(
    actWeight: reader.readDoubleOrNull(offsets[0]),
    actualRep: reader.readLongOrNull(offsets[1]),
    estRep: reader.readStringOrNull(offsets[2]),
    estWeight: reader.readDoubleOrNull(offsets[3]),
    isCompleted: reader.readBoolOrNull(offsets[4]) ?? false,
    rpe: reader.readDoubleOrNull(offsets[5]),
  );
  return object;
}

P _performedSetsIsarDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PerformedSetsIsarQueryFilter
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QFilterCondition> {
  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actWeight',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actWeight',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actualRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualRep',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actualRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualRep',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actualRepEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actualRepGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actualRepLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      actualRepBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualRep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estRep',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estRep',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estRep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estRep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estRep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estRep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estRep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estRep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estRep',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estRep',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estRep',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estRepIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estRep',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estWeight',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      estWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estWeight',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      rpeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rpe',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      rpeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rpe',
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      rpeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rpe',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      rpeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rpe',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      rpeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rpe',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      rpeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rpe',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PerformedSetsIsarQueryObject
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QFilterCondition> {}
