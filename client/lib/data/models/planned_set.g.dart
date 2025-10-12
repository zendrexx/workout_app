// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_set.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlannedSetCollection on Isar {
  IsarCollection<PlannedSet> get plannedSets => this.collection();
}

const PlannedSetSchema = CollectionSchema(
  name: r'PlannedSet',
  id: 274001502372112171,
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
    )
  },
  estimateSize: _plannedSetEstimateSize,
  serialize: _plannedSetSerialize,
  deserialize: _plannedSetDeserialize,
  deserializeProp: _plannedSetDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'exercise': LinkSchema(
      id: -2975236721772223910,
      name: r'exercise',
      target: r'Exercise',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _plannedSetGetId,
  getLinks: _plannedSetGetLinks,
  attach: _plannedSetAttach,
  version: '3.1.0+1',
);

int _plannedSetEstimateSize(
  PlannedSet object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _plannedSetSerialize(
  PlannedSet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.estWeight);
  writer.writeLong(offsets[1], object.maxRep);
  writer.writeLong(offsets[2], object.minRep);
}

PlannedSet _plannedSetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlannedSet(
    estWeight: reader.readDoubleOrNull(offsets[0]),
    id: id,
    maxRep: reader.readLongOrNull(offsets[1]),
    minRep: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _plannedSetDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _plannedSetGetId(PlannedSet object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _plannedSetGetLinks(PlannedSet object) {
  return [object.exercise];
}

void _plannedSetAttach(IsarCollection<dynamic> col, Id id, PlannedSet object) {
  object.id = id;
  object.exercise.attach(col, col.isar.collection<Exercise>(), r'exercise', id);
}

extension PlannedSetQueryWhereSort
    on QueryBuilder<PlannedSet, PlannedSet, QWhere> {
  QueryBuilder<PlannedSet, PlannedSet, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlannedSetQueryWhere
    on QueryBuilder<PlannedSet, PlannedSet, QWhereClause> {
  QueryBuilder<PlannedSet, PlannedSet, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterWhereClause> idBetween(
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

extension PlannedSetQueryFilter
    on QueryBuilder<PlannedSet, PlannedSet, QFilterCondition> {
  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition>
      estWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estWeight',
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition>
      estWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estWeight',
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> estWeightEqualTo(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition>
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> estWeightLessThan(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> estWeightBetween(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> maxRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxRep',
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition>
      maxRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxRep',
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> maxRepEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> maxRepGreaterThan(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> maxRepLessThan(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> maxRepBetween(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> minRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minRep',
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition>
      minRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minRep',
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> minRepEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minRep',
        value: value,
      ));
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> minRepGreaterThan(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> minRepLessThan(
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

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> minRepBetween(
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
}

extension PlannedSetQueryObject
    on QueryBuilder<PlannedSet, PlannedSet, QFilterCondition> {}

extension PlannedSetQueryLinks
    on QueryBuilder<PlannedSet, PlannedSet, QFilterCondition> {
  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> exercise(
      FilterQuery<Exercise> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'exercise');
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterFilterCondition> exerciseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'exercise', 0, true, 0, true);
    });
  }
}

extension PlannedSetQuerySortBy
    on QueryBuilder<PlannedSet, PlannedSet, QSortBy> {
  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> sortByEstWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.asc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> sortByEstWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.desc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> sortByMaxRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRep', Sort.asc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> sortByMaxRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRep', Sort.desc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> sortByMinRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRep', Sort.asc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> sortByMinRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRep', Sort.desc);
    });
  }
}

extension PlannedSetQuerySortThenBy
    on QueryBuilder<PlannedSet, PlannedSet, QSortThenBy> {
  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> thenByEstWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.asc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> thenByEstWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.desc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> thenByMaxRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRep', Sort.asc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> thenByMaxRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRep', Sort.desc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> thenByMinRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRep', Sort.asc);
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QAfterSortBy> thenByMinRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRep', Sort.desc);
    });
  }
}

extension PlannedSetQueryWhereDistinct
    on QueryBuilder<PlannedSet, PlannedSet, QDistinct> {
  QueryBuilder<PlannedSet, PlannedSet, QDistinct> distinctByEstWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estWeight');
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QDistinct> distinctByMaxRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRep');
    });
  }

  QueryBuilder<PlannedSet, PlannedSet, QDistinct> distinctByMinRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minRep');
    });
  }
}

extension PlannedSetQueryProperty
    on QueryBuilder<PlannedSet, PlannedSet, QQueryProperty> {
  QueryBuilder<PlannedSet, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlannedSet, double?, QQueryOperations> estWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estWeight');
    });
  }

  QueryBuilder<PlannedSet, int?, QQueryOperations> maxRepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRep');
    });
  }

  QueryBuilder<PlannedSet, int?, QQueryOperations> minRepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minRep');
    });
  }
}
