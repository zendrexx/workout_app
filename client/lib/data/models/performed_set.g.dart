// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performed_set.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPerformedSetCollection on Isar {
  IsarCollection<PerformedSet> get performedSets => this.collection();
}

const PerformedSetSchema = CollectionSchema(
  name: r'PerformedSet',
  id: -807446212502387918,
  properties: {
    r'performedRep': PropertySchema(
      id: 0,
      name: r'performedRep',
      type: IsarType.long,
    ),
    r'performedWeight': PropertySchema(
      id: 1,
      name: r'performedWeight',
      type: IsarType.double,
    )
  },
  estimateSize: _performedSetEstimateSize,
  serialize: _performedSetSerialize,
  deserialize: _performedSetDeserialize,
  deserializeProp: _performedSetDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'exercise': LinkSchema(
      id: 4308754833463477642,
      name: r'exercise',
      target: r'ExerciseIsar',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _performedSetGetId,
  getLinks: _performedSetGetLinks,
  attach: _performedSetAttach,
  version: '3.1.0+1',
);

int _performedSetEstimateSize(
  PerformedSet object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _performedSetSerialize(
  PerformedSet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.performedRep);
  writer.writeDouble(offsets[1], object.performedWeight);
}

PerformedSet _performedSetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerformedSet(
    performedRep: reader.readLongOrNull(offsets[0]),
    performedWeight: reader.readDoubleOrNull(offsets[1]),
  );
  object.id = id;
  return object;
}

P _performedSetDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _performedSetGetId(PerformedSet object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _performedSetGetLinks(PerformedSet object) {
  return [object.exercise];
}

void _performedSetAttach(
    IsarCollection<dynamic> col, Id id, PerformedSet object) {
  object.id = id;
  object.exercise
      .attach(col, col.isar.collection<ExerciseIsar>(), r'exercise', id);
}

extension PerformedSetQueryWhereSort
    on QueryBuilder<PerformedSet, PerformedSet, QWhere> {
  QueryBuilder<PerformedSet, PerformedSet, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PerformedSetQueryWhere
    on QueryBuilder<PerformedSet, PerformedSet, QWhereClause> {
  QueryBuilder<PerformedSet, PerformedSet, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PerformedSet, PerformedSet, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterWhereClause> idBetween(
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

extension PerformedSetQueryFilter
    on QueryBuilder<PerformedSet, PerformedSet, QFilterCondition> {
  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'performedRep',
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'performedRep',
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedRepEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performedRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedRepGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performedRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedRepLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performedRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedRepBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performedRep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'performedWeight',
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'performedWeight',
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performedWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performedWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performedWeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      performedWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performedWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PerformedSetQueryObject
    on QueryBuilder<PerformedSet, PerformedSet, QFilterCondition> {}

extension PerformedSetQueryLinks
    on QueryBuilder<PerformedSet, PerformedSet, QFilterCondition> {
  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition> exercise(
      FilterQuery<ExerciseIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'exercise');
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterFilterCondition>
      exerciseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'exercise', 0, true, 0, true);
    });
  }
}

extension PerformedSetQuerySortBy
    on QueryBuilder<PerformedSet, PerformedSet, QSortBy> {
  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy> sortByPerformedRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedRep', Sort.asc);
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy>
      sortByPerformedRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedRep', Sort.desc);
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy>
      sortByPerformedWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedWeight', Sort.asc);
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy>
      sortByPerformedWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedWeight', Sort.desc);
    });
  }
}

extension PerformedSetQuerySortThenBy
    on QueryBuilder<PerformedSet, PerformedSet, QSortThenBy> {
  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy> thenByPerformedRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedRep', Sort.asc);
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy>
      thenByPerformedRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedRep', Sort.desc);
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy>
      thenByPerformedWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedWeight', Sort.asc);
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QAfterSortBy>
      thenByPerformedWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedWeight', Sort.desc);
    });
  }
}

extension PerformedSetQueryWhereDistinct
    on QueryBuilder<PerformedSet, PerformedSet, QDistinct> {
  QueryBuilder<PerformedSet, PerformedSet, QDistinct> distinctByPerformedRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performedRep');
    });
  }

  QueryBuilder<PerformedSet, PerformedSet, QDistinct>
      distinctByPerformedWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performedWeight');
    });
  }
}

extension PerformedSetQueryProperty
    on QueryBuilder<PerformedSet, PerformedSet, QQueryProperty> {
  QueryBuilder<PerformedSet, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerformedSet, int?, QQueryOperations> performedRepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performedRep');
    });
  }

  QueryBuilder<PerformedSet, double?, QQueryOperations>
      performedWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performedWeight');
    });
  }
}
