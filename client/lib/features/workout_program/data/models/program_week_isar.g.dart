// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_week_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ProgramWeekIsarSchema = Schema(
  name: r'ProgramWeekIsar',
  id: -6072934678512853471,
  properties: {
    r'sessions': PropertySchema(
      id: 0,
      name: r'sessions',
      type: IsarType.objectList,
      target: r'ProgramSessionIsar',
    ),
    r'weekId': PropertySchema(
      id: 1,
      name: r'weekId',
      type: IsarType.string,
    ),
    r'weekNumber': PropertySchema(
      id: 2,
      name: r'weekNumber',
      type: IsarType.long,
    )
  },
  estimateSize: _programWeekIsarEstimateSize,
  serialize: _programWeekIsarSerialize,
  deserialize: _programWeekIsarDeserialize,
  deserializeProp: _programWeekIsarDeserializeProp,
);

int _programWeekIsarEstimateSize(
  ProgramWeekIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.sessions.length * 3;
  {
    final offsets = allOffsets[ProgramSessionIsar]!;
    for (var i = 0; i < object.sessions.length; i++) {
      final value = object.sessions[i];
      bytesCount +=
          ProgramSessionIsarSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.weekId.length * 3;
  return bytesCount;
}

void _programWeekIsarSerialize(
  ProgramWeekIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<ProgramSessionIsar>(
    offsets[0],
    allOffsets,
    ProgramSessionIsarSchema.serialize,
    object.sessions,
  );
  writer.writeString(offsets[1], object.weekId);
  writer.writeLong(offsets[2], object.weekNumber);
}

ProgramWeekIsar _programWeekIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProgramWeekIsar(
    weekId: reader.readStringOrNull(offsets[1]) ?? "",
    weekNumber: reader.readLongOrNull(offsets[2]) ?? 0,
  );
  object.sessions = reader.readObjectList<ProgramSessionIsar>(
        offsets[0],
        ProgramSessionIsarSchema.deserialize,
        allOffsets,
        ProgramSessionIsar(),
      ) ??
      [];
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
      return (reader.readObjectList<ProgramSessionIsar>(
            offset,
            ProgramSessionIsarSchema.deserialize,
            allOffsets,
            ProgramSessionIsar(),
          ) ??
          []) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ProgramWeekIsarQueryFilter
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QFilterCondition> {
  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sessions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sessions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sessions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sessions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sessions',
        length,
        include,
        999999,
        true,
      );
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
      return query.listLength(
        r'sessions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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
    on QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QFilterCondition> {
  QueryBuilder<ProgramWeekIsar, ProgramWeekIsar, QAfterFilterCondition>
      sessionsElement(FilterQuery<ProgramSessionIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sessions');
    });
  }
}
