import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';
import 'package:job_offer_repository/job_offer_repository.dart';

bool Function(JobOffer j) matchFilter(OpportunityFilter filter) {
  return (j) {
    var matchLocation = true;
    var matchContract = true;
    var matchSeniority = true;
    if (filter.containsLocationFilter()) {
      final matchFullRemote = filter.filters.contains(Filter.fullRemote) &&
          j.teamLocation == TeamLocation.fullRemote;
      final matchHybrid = filter.filters.contains(Filter.hybrid) &&
          j.teamLocation == TeamLocation.hybrid;
      final matchOnSite = filter.filters.contains(Filter.onSite) &&
          j.teamLocation == TeamLocation.onSite;
      matchLocation = matchFullRemote || matchHybrid || matchOnSite;
    }
    if (filter.containsContractFilter()) {
      final matchFullTime = filter.filters.contains(Filter.fullTime) &&
          j.contract == Contract.fullTime;
      final matchPartTime = filter.filters.contains(Filter.partTime) &&
          j.contract == Contract.partTime;
      matchContract = matchFullTime || matchPartTime;
    }
    if (filter.containsSeniorityFilter()) {
      final matchJunior = filter.filters.contains(Filter.junior) &&
          j.seniority == Seniority.junion;
      final matchMid =
          filter.filters.contains(Filter.mid) && j.seniority == Seniority.mid;
      final matchSenior = filter.filters.contains(Filter.senior) &&
          j.seniority == Seniority.senior;
      matchSeniority = matchJunior || matchMid || matchSenior;
    }
    return matchLocation && matchContract && matchSeniority;
  };
}

extension ContainsFilter on OpportunityFilter {
  bool containsLocationFilter() {
    return filters.contains(Filter.fullRemote) ||
        filters.contains(Filter.hybrid) ||
        filters.contains(Filter.onSite);
  }

  bool containsContractFilter() {
    return filters.contains(Filter.fullTime) ||
        filters.contains(Filter.partTime);
  }

  bool containsSeniorityFilter() {
    return filters.contains(Filter.junior) ||
        filters.contains(Filter.mid) ||
        filters.contains(Filter.senior);
  }
}
