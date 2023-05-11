part of 'opportunity_list_bloc.dart';

enum OpportunityType { jobOffer, freelanceProject }

enum Filter {
  fullRemote,
  hybrid,
  onSite,
  fullTime,
  partTime,
  junior,
  mid,
  senior
}

class OpportunityFilter extends Equatable {
  const OpportunityFilter({this.title, this.filters = const []});

  final String? title;
  final List<Filter> filters;

  OpportunityFilter copyWith({String? title, List<Filter>? filters}) {
    return OpportunityFilter(
      title: title ?? this.title,
      filters: filters ?? this.filters,
    );
  }

  OpportunityFilter toggleFilter(Filter filter) {
    return OpportunityFilter(
      title: title,
      filters: filters.contains(filter)
          ? filters.where((f) => f != filter).toList()
          : [...filters, filter],
    );
  }

  @override
  List<Object?> get props => [title, filters];
}

@immutable
abstract class OpportunityListState extends Equatable {
  const OpportunityListState(
    this.jobOfferList,
    this.freelanceList,
    this.selectedType,
    this.filter,
    this.filterToApply,
  );

  final List<JobOffer> jobOfferList;
  final List<Freelance> freelanceList;
  final OpportunityType selectedType;
  final OpportunityFilter filter;
  final OpportunityFilter filterToApply;

  List<Opportunity> get filteredOpportunities {
    final opportunities = selectedType == OpportunityType.jobOffer
        ? jobOfferList
            .where(matchFilter(filter))
            .toList()
            .map(Opportunity.fromJobOffer)
            .toList()
        : freelanceList.map(Opportunity.fromFreelance).toList();
    if (filter.title == null || filter.title!.isEmpty) return opportunities;
    return opportunities.where((opportunity) {
      if (filter.title != null &&
          filter.title!.isNotEmpty &&
          !opportunity.title
              .toLowerCase()
              .contains(filter.title!.toLowerCase())) return false;
      return true;
    }).toList();
  }

  @override
  List<Object?> get props =>
      [jobOfferList, freelanceList, selectedType, filter, filterToApply];
}

class OpportunityListInitial extends OpportunityListState {
  const OpportunityListInitial(
    super.jobOfferList,
    super.freelanceList,
    super.selectedType,
    super.filter,
    super.filterToApply,
  );
}

class OpportunityListFilled extends OpportunityListState {
  const OpportunityListFilled(
    super.jobOfferList,
    super.freelanceList,
    super.selectedType,
    super.filter,
    super.filterToApply,
  );
}
