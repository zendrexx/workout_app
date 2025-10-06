// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_sets.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutsetsCollection on Isar {
  IsarCollection<Workoutsets> get workoutsets => this.collection();
}

const WorkoutsetsSchema = CollectionSchema(
  name: r'Workoutsets',
  id: 5100509834886041033,
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
    r'estWeight': PropertySchema(
      id: 2,
      name: r'estWeight',
      type: IsarType.double,
    ),
    r'isCompleted': PropertySchema(
      id: 3,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'maxRep': PropertySchema(
      id: 4,
      name: r'maxRep',
      type: IsarType.long,
    ),
    r'minRep': PropertySchema(
      id: 5,
      name: r'minRep',
      type: IsarType.long,
    )
  },
  estimateSize: _workoutsetsEstimateSize,
  serialize: _workoutsetsSerialize,
  deserialize: _workoutsetsDeserialize,
  deserializeProp: _workoutsetsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _workoutsetsGetId,
  getLinks: _workoutsetsGetLinks,
  attach: _workoutsetsAttach,
  version: '3.1.0+1',
);

int _workoutsetsEstimateSize(
  Workoutsets object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _workoutsetsSerialize(
  Workoutsets object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.actWeight);
  writer.writeLong(offsets[1], object.actualRep);
  writer.writeDouble(offsets[2], object.estWeight);
  writer.writeBool(offsets[3], object.isCompleted);
  writer.writeLong(offsets[4], object.maxRep);
  writer.writeLong(offsets[5], object.minRep);
}

Workoutsets _workoutsetsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Workoutsets(
    actWeight: reader.readDoubleOrNull(offsets[0]),
    actualRep: reader.readLongOrNull(offsets[1]),
    estWeight: reader.readDoubleOrNull(offsets[2]),
    isCompleted: reader.readBoolOrNull(offsets[3]) ?? false,
    maxRep: reader.readLongOrNull(offsets[4]),
    minRep: reader.readLongOrNull(offsets[5]),
  );
  object.id = id;
  return object;
}

P _workoutsetsDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutsetsGetId(Workoutsets object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutsetsGetLinks(Workoutsets object) {
  return [];
}

void _workoutsetsAttach(
    IsarCollection<dynamic> col, Id id, Workoutsets object) {
  object.id = id;
}

extension WorkoutsetsQueryWhereSort
    on QueryBuilder<Workoutsets, Workoutsets, QWhere> {
  QueryBuilder<Workoutsets, Workoutsets, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutsetsQueryWhere
    on QueryBuilder<Workoutsets, Workoutsets, QWhereClause> {
  QueryBuilder<Workoutsets, Workoutsets, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterWhereClause> idBetween(
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

extension WorkoutsetsQueryFilter
    on QueryBuilder<Workoutsets, Workoutsets, QFilterCondition> {
  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      actWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actWeight',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      actWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actWeight',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      actualRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualRep',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      actualRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualRep',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      actualRepEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualRep',
        value: value,
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      estWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estWeight',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      estWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estWeight',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> maxRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxRep',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      maxRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxRep',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> maxRepEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxRep',
        value: value,
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> maxRepLessThan(
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> maxRepBetween(
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> minRepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minRep',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
      minRepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minRep',
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> minRepEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minRep',
        value: value,
      ));
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition>
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> minRepLessThan(
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

  QueryBuilder<Workoutsets, Workoutsets, QAfterFilterCondition> minRepBetween(
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

extension WorkoutsetsQueryObject
    on QueryBuilder<Workoutsets, Workoutsets, QFilterCondition> {}

extension WorkoutsetsQueryLinks
    on QueryBuilder<Workoutsets, Workoutsets, QFilterCondition> {}

extension WorkoutsetsQuerySortBy
    on QueryBuilder<Workoutsets, Workoutsets, QSortBy> {
  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByActWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actWeight', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByActWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actWeight', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByActualRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualRep', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByActualRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualRep', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByEstWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByEstWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByMaxRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRep', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByMaxRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRep', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByMinRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRep', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> sortByMinRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRep', Sort.desc);
    });
  }
}

extension WorkoutsetsQuerySortThenBy
    on QueryBuilder<Workoutsets, Workoutsets, QSortThenBy> {
  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByActWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actWeight', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByActWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actWeight', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByActualRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualRep', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByActualRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualRep', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByEstWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByEstWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estWeight', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByMaxRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRep', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByMaxRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxRep', Sort.desc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByMinRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRep', Sort.asc);
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QAfterSortBy> thenByMinRepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minRep', Sort.desc);
    });
  }
}

extension WorkoutsetsQueryWhereDistinct
    on QueryBuilder<Workoutsets, Workoutsets, QDistinct> {
  QueryBuilder<Workoutsets, Workoutsets, QDistinct> distinctByActWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actWeight');
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QDistinct> distinctByActualRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualRep');
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QDistinct> distinctByEstWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estWeight');
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QDistinct> distinctByMaxRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxRep');
    });
  }

  QueryBuilder<Workoutsets, Workoutsets, QDistinct> distinctByMinRep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minRep');
    });
  }
}

extension WorkoutsetsQueryProperty
    on QueryBuilder<Workoutsets, Workoutsets, QQueryProperty> {
  QueryBuilder<Workoutsets, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Workoutsets, double?, QQueryOperations> actWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actWeight');
    });
  }

  QueryBuilder<Workoutsets, int?, QQueryOperations> actualRepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualRep');
    });
  }

  QueryBuilder<Workoutsets, double?, QQueryOperations> estWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estWeight');
    });
  }

  QueryBuilder<Workoutsets, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<Workoutsets, int?, QQueryOperations> maxRepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxRep');
    });
  }

  QueryBuilder<Workoutsets, int?, QQueryOperations> minRepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minRep');
    });
  }
}
