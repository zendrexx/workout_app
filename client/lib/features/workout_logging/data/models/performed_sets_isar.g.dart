// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performed_sets_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPerformedSetsIsarCollection on Isar {
  IsarCollection<PerformedSetsIsar> get performedSetsIsars => this.collection();
}

const PerformedSetsIsarSchema = CollectionSchema(
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
    )
  },
  estimateSize: _performedSetsIsarEstimateSize,
  serialize: _performedSetsIsarSerialize,
  deserialize: _performedSetsIsarDeserialize,
  deserializeProp: _performedSetsIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _performedSetsIsarGetId,
  getLinks: _performedSetsIsarGetLinks,
  attach: _performedSetsIsarAttach,
  version: '3.1.0+1',
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
  );
  object.id = id;
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _performedSetsIsarGetId(PerformedSetsIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _performedSetsIsarGetLinks(
    PerformedSetsIsar object) {
  return [];
}

void _performedSetsIsarAttach(
    IsarCollection<dynamic> col, Id id, PerformedSetsIsar object) {
  object.id = id;
}

extension PerformedSetsIsarQueryWhereSort
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QWhere> {
  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PerformedSetsIsarQueryWhere
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QWhereClause> {
  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterWhereClause>
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

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterWhereClause>
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
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
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

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }
}

extension PerformedSetsIsarQueryObject
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QFilterCondition> {}

extension PerformedSetsIsarQueryLinks
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QFilterCondition> {}

extension PerformedSetsIsarQuerySortBy
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QSortBy> {
  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByActWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actWeight', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByActWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actWeight', Sort.desc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByActualRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualRep', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByActualRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualRep', Sort.desc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByEstRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estRep', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByEstRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estRep', Sort.desc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByEstWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByEstWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.desc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }
}

extension PerformedSetsIsarQuerySortThenBy
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QSortThenBy> {
  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByActWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actWeight', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByActWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actWeight', Sort.desc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByActualRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualRep', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByActualRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualRep', Sort.desc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByEstRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estRep', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByEstRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estRep', Sort.desc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByEstWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByEstWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.desc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }
}

extension PerformedSetsIsarQueryWhereDistinct
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QDistinct> {
  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QDistinct>
      distinctByActWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actWeight');
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QDistinct>
      distinctByActualRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualRep');
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QDistinct>
      distinctByEstRep({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estRep', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QDistinct>
      distinctByEstWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estWeight');
    });
  }

  QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }
}

extension PerformedSetsIsarQueryProperty
    on QueryBuilder<PerformedSetsIsar, PerformedSetsIsar, QQueryProperty> {
  QueryBuilder<PerformedSetsIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerformedSetsIsar, double?, QQueryOperations>
      actWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actWeight');
    });
  }

  QueryBuilder<PerformedSetsIsar, int?, QQueryOperations> actualRepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualRep');
    });
  }

  QueryBuilder<PerformedSetsIsar, String?, QQueryOperations> estRepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estRep');
    });
  }

  QueryBuilder<PerformedSetsIsar, double?, QQueryOperations>
      estWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estWeight');
    });
  }

  QueryBuilder<PerformedSetsIsar, bool, QQueryOperations>
      isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }
}
