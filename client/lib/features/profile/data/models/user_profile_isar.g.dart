// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserProfileIsarCollection on Isar {
  IsarCollection<UserProfileIsar> get userProfileIsars => this.collection();
}

const UserProfileIsarSchema = CollectionSchema(
  name: r'UserProfileIsar',
  id: 8363191472987497192,
  properties: {
    r'avatarPath': PropertySchema(
      id: 0,
      name: r'avatarPath',
      type: IsarType.string,
    ),
    r'bio': PropertySchema(
      id: 1,
      name: r'bio',
      type: IsarType.string,
    ),
    r'bodyWeightLbs': PropertySchema(
      id: 2,
      name: r'bodyWeightLbs',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'displayName': PropertySchema(
      id: 4,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'heightCm': PropertySchema(
      id: 5,
      name: r'heightCm',
      type: IsarType.double,
    ),
    r'manualBenchLbs': PropertySchema(
      id: 6,
      name: r'manualBenchLbs',
      type: IsarType.double,
    ),
    r'manualDeadliftLbs': PropertySchema(
      id: 7,
      name: r'manualDeadliftLbs',
      type: IsarType.double,
    ),
    r'manualOverheadPressLbs': PropertySchema(
      id: 8,
      name: r'manualOverheadPressLbs',
      type: IsarType.double,
    ),
    r'manualSquatLbs': PropertySchema(
      id: 9,
      name: r'manualSquatLbs',
      type: IsarType.double,
    ),
    r'unitName': PropertySchema(
      id: 10,
      name: r'unitName',
      type: IsarType.string,
    )
  },
  estimateSize: _userProfileIsarEstimateSize,
  serialize: _userProfileIsarSerialize,
  deserialize: _userProfileIsarDeserialize,
  deserializeProp: _userProfileIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userProfileIsarGetId,
  getLinks: _userProfileIsarGetLinks,
  attach: _userProfileIsarAttach,
  version: '3.1.0+1',
);

int _userProfileIsarEstimateSize(
  UserProfileIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatarPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.bio.length * 3;
  bytesCount += 3 + object.displayName.length * 3;
  bytesCount += 3 + object.unitName.length * 3;
  return bytesCount;
}

void _userProfileIsarSerialize(
  UserProfileIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatarPath);
  writer.writeString(offsets[1], object.bio);
  writer.writeDouble(offsets[2], object.bodyWeightLbs);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.displayName);
  writer.writeDouble(offsets[5], object.heightCm);
  writer.writeDouble(offsets[6], object.manualBenchLbs);
  writer.writeDouble(offsets[7], object.manualDeadliftLbs);
  writer.writeDouble(offsets[8], object.manualOverheadPressLbs);
  writer.writeDouble(offsets[9], object.manualSquatLbs);
  writer.writeString(offsets[10], object.unitName);
}

UserProfileIsar _userProfileIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserProfileIsar();
  object.avatarPath = reader.readStringOrNull(offsets[0]);
  object.bio = reader.readString(offsets[1]);
  object.bodyWeightLbs = reader.readDouble(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.displayName = reader.readString(offsets[4]);
  object.heightCm = reader.readDouble(offsets[5]);
  object.id = id;
  object.manualBenchLbs = reader.readDoubleOrNull(offsets[6]);
  object.manualDeadliftLbs = reader.readDoubleOrNull(offsets[7]);
  object.manualOverheadPressLbs = reader.readDoubleOrNull(offsets[8]);
  object.manualSquatLbs = reader.readDoubleOrNull(offsets[9]);
  object.unitName = reader.readString(offsets[10]);
  return object;
}

P _userProfileIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userProfileIsarGetId(UserProfileIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userProfileIsarGetLinks(UserProfileIsar object) {
  return [];
}

void _userProfileIsarAttach(
    IsarCollection<dynamic> col, Id id, UserProfileIsar object) {
  object.id = id;
}

extension UserProfileIsarQueryWhereSort
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QWhere> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserProfileIsarQueryWhere
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QWhereClause> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause>
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

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause> idBetween(
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

extension UserProfileIsarQueryFilter
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QFilterCondition> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarPath',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarPath',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarPath',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      avatarPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarPath',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bio',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bio',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bodyWeightLbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodyWeightLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bodyWeightLbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bodyWeightLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bodyWeightLbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bodyWeightLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      bodyWeightLbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bodyWeightLbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      heightCmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heightCm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      heightCmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'heightCm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      heightCmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'heightCm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      heightCmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'heightCm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
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

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
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

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
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

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualBenchLbsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'manualBenchLbs',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualBenchLbsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'manualBenchLbs',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualBenchLbsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manualBenchLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualBenchLbsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manualBenchLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualBenchLbsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manualBenchLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualBenchLbsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manualBenchLbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualDeadliftLbsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'manualDeadliftLbs',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualDeadliftLbsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'manualDeadliftLbs',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualDeadliftLbsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manualDeadliftLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualDeadliftLbsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manualDeadliftLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualDeadliftLbsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manualDeadliftLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualDeadliftLbsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manualDeadliftLbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualOverheadPressLbsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'manualOverheadPressLbs',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualOverheadPressLbsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'manualOverheadPressLbs',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualOverheadPressLbsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manualOverheadPressLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualOverheadPressLbsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manualOverheadPressLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualOverheadPressLbsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manualOverheadPressLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualOverheadPressLbsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manualOverheadPressLbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualSquatLbsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'manualSquatLbs',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualSquatLbsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'manualSquatLbs',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualSquatLbsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manualSquatLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualSquatLbsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manualSquatLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualSquatLbsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manualSquatLbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      manualSquatLbsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manualSquatLbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      unitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitName',
        value: '',
      ));
    });
  }
}

extension UserProfileIsarQueryObject
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QFilterCondition> {}

extension UserProfileIsarQueryLinks
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QFilterCondition> {}

extension UserProfileIsarQuerySortBy
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QSortBy> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByAvatarPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPath', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByAvatarPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPath', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy> sortByBio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bio', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy> sortByBioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bio', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByBodyWeightLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyWeightLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByBodyWeightLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyWeightLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByHeightCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightCm', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByHeightCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightCm', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByManualBenchLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualBenchLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByManualBenchLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualBenchLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByManualDeadliftLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualDeadliftLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByManualDeadliftLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualDeadliftLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByManualOverheadPressLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualOverheadPressLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByManualOverheadPressLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualOverheadPressLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByManualSquatLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualSquatLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByManualSquatLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualSquatLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.desc);
    });
  }
}

extension UserProfileIsarQuerySortThenBy
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QSortThenBy> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByAvatarPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPath', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByAvatarPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPath', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy> thenByBio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bio', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy> thenByBioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bio', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByBodyWeightLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyWeightLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByBodyWeightLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyWeightLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByHeightCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightCm', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByHeightCmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heightCm', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByManualBenchLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualBenchLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByManualBenchLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualBenchLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByManualDeadliftLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualDeadliftLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByManualDeadliftLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualDeadliftLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByManualOverheadPressLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualOverheadPressLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByManualOverheadPressLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualOverheadPressLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByManualSquatLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualSquatLbs', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByManualSquatLbsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manualSquatLbs', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.desc);
    });
  }
}

extension UserProfileIsarQueryWhereDistinct
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByAvatarPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct> distinctByBio(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByBodyWeightLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bodyWeightLbs');
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByDisplayName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByHeightCm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'heightCm');
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByManualBenchLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manualBenchLbs');
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByManualDeadliftLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manualDeadliftLbs');
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByManualOverheadPressLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manualOverheadPressLbs');
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByManualSquatLbs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manualSquatLbs');
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct> distinctByUnitName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitName', caseSensitive: caseSensitive);
    });
  }
}

extension UserProfileIsarQueryProperty
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QQueryProperty> {
  QueryBuilder<UserProfileIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserProfileIsar, String?, QQueryOperations>
      avatarPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarPath');
    });
  }

  QueryBuilder<UserProfileIsar, String, QQueryOperations> bioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bio');
    });
  }

  QueryBuilder<UserProfileIsar, double, QQueryOperations>
      bodyWeightLbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bodyWeightLbs');
    });
  }

  QueryBuilder<UserProfileIsar, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<UserProfileIsar, String, QQueryOperations>
      displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<UserProfileIsar, double, QQueryOperations> heightCmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'heightCm');
    });
  }

  QueryBuilder<UserProfileIsar, double?, QQueryOperations>
      manualBenchLbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manualBenchLbs');
    });
  }

  QueryBuilder<UserProfileIsar, double?, QQueryOperations>
      manualDeadliftLbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manualDeadliftLbs');
    });
  }

  QueryBuilder<UserProfileIsar, double?, QQueryOperations>
      manualOverheadPressLbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manualOverheadPressLbs');
    });
  }

  QueryBuilder<UserProfileIsar, double?, QQueryOperations>
      manualSquatLbsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manualSquatLbs');
    });
  }

  QueryBuilder<UserProfileIsar, String, QQueryOperations> unitNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitName');
    });
  }
}
