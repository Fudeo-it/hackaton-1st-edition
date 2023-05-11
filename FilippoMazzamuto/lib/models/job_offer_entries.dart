import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/utils/extensions/enum_extension.dart';

class JobOfferEntries extends Equatable{
  final List<Sort> sorts;
  final CompoundFilter? filter;

  const JobOfferEntries({
    this.sorts = const [],
    this.filter,
  });

  @override
  List<Object?> get props => [sorts, filter];

  Map<String, dynamic> toJson([bool removePropertyNull = false]) {
    Map<String, dynamic> json = {
      "sorts": sorts.map((sort) => sort.toJson(removePropertyNull))
        .toList(growable: false),
      "filter": filter?.toJson(),
    };
    if (removePropertyNull) {
      return json..removeWhere((key, value) => value == null);
    }
    return json;
  }

  JobOfferEntries copyWith({
    final List<Sort>? sorts,
    final CompoundFilter? filter,
  }) {
    return JobOfferEntries(
      sorts: sorts ?? this.sorts,
      filter: filter ?? this.filter,
    );
  }

  List<dynamic> allActiveFilters() {
    return [
      ...sorts,
      if(filter != null)
        ...filter!.filters.expand((filter) => 
          (filter as CompoundFilter).filters)
          .toList(growable: false),
    ];
  }

  /// I valori di queste proprietà statiche per i filtri, è raccomandato
  /// di ottenerli tramite API, in assenza di tale API
  /// momentaneamente si impostatano staticamente.
  static const properties = [
    'Job Posted',
  ];

  static const sortDirection = [
    'ascending',
    'descending',
  ];

  static const timestamp = [
    'created_time',
    'last_edited_time',
  ];

  /// Filter Recruitment
  static const recruitmentFilter = {
    "Team": ['Full Remote', 'Ibrido', 'In sede'],
    "Seniority": ['Junior', 'Mid', 'Senior'],
    "Contratto": ['Full time', 'Part time'],
  };

  /// Filter Freelance
  static const freelanceFilter = {
    "NDA": ['Sì', 'No'],
    "Tipo di relazione": ['Solo con chi commissiona il lavoro','Con altri professionisti'],
  };
}

/// Sort Filter
class Sort extends Equatable {
  final String? property;
  final Direction direction;
  final Timestamp? timestamp;

  const Sort({
    this.property,
    this.direction = Direction.ascending,
    this.timestamp,
  });

  Sort copyWith({
    String? property,
    Direction? direction,
    Timestamp? timestamp,
  }) {
    return Sort(
      property: property ?? this.property,
      direction: direction ?? this.direction,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  List<Object?> get props => [
    property,
    timestamp,
  ];

  Map<String, dynamic> toJson([bool removePropertyNull = false]) {
    Map<String, dynamic> json = {
      "property": property,
      "direction": direction.toShortString(),
      "timestamp": timestamp?.toShortString(),
    };
    if (removePropertyNull) {
      return json..removeWhere((key, value) => value == null);
    }
    return json;
  }
}

enum Direction {ascending, descending}

// ignore: constant_identifier_names
enum Timestamp {created_time, last_edited_time}


/// Filter compatible with notion
/// https://developers.notion.com/reference/post-database-query-filter
abstract class Filter extends Equatable {
  const Filter();

  Map<String, dynamic> toJson();

  @override
  List<Object?> get props => [];
}

class CompoundFilter extends Filter {
  final List<Filter> filters;
  final Operator operator;

  const CompoundFilter.and({
    required this.filters
  }) : operator = Operator.and;

  const CompoundFilter.or({
    required this.filters,
  }) : operator = Operator.or;

  @override
  Map<String, dynamic> toJson() => {
    operator.toShortString() : filters.map((f) =>
    f.toJson()).toList(),
  };

  @override
  List<Object?> get props => [filters, operator];
}

enum Operator {
  and, 
  or,
}

/// https://developers.notion.com/reference/post-database-query-filter#select
class DatabaseEntries extends Filter {
  final String property;
  final Condition condition;
  final FilterCondition value;

  const DatabaseEntries.select({
    required this.property,
    required this.value,
  }) : condition = Condition.select;
  // TODO: implementare i restanti costruttori per ogni Condition

  @override
  Map<String, dynamic> toJson() => {
    'property': property,
    condition.toShortString(): value.toJson(),
  };

  @override
  List<Object?> get props => [property, condition, value];
}

enum Condition {
  checkbox,
  date,
  files,
  formula,
  multi_select,
  number,
  people,
  phone_number,
  relation,
  rich_text,
  select,
  status,
  timestamp,
}


abstract class FilterCondition extends Filter {
  const FilterCondition();

  @override
  List<Object?> get props => [];
}

class SelectValue extends FilterCondition {
  final dynamic value;
  final Comparison comparison;

  const SelectValue.equals({
    required this.value
  }) : comparison = Comparison.equals;

  const SelectValue.doesNotEqual({
    required this.value
  }) : comparison = Comparison.does_not_equal;

  const SelectValue.isEmpty({
    required this.value
  }) : comparison = Comparison.is_empty;

  const SelectValue.isNotEmpty({
    required this.value
  }) : comparison = Comparison.is_not_empty;

  @override
  Map<String, dynamic> toJson() => {
    comparison.toShortString(): value
  };

  @override
  List<Object?> get props => [comparison, value];
}

/// TODO: Bisogna implementare le altre classi di condizione

enum Comparison { 
  equals,
  does_not_equal,
  is_empty,
  is_not_empty,
}
