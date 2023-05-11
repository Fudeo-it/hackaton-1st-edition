part of 'job_offers_bloc.dart';

enum JobOffersStatus { initial, loading, success, failure }

class JobOffersState extends Equatable {
  final JobOffersStatus status;
  final List<JobOffer> jobOffers;
  final bool hasMore;
  final String? nextCursor;
  final String errorMessage;
  final JobOfferEntries entries;

  const JobOffersState({
    this.status = JobOffersStatus.initial,
    this.jobOffers = const [],
    this.hasMore = true,
    this.nextCursor,
    this.errorMessage = '',
    this.entries = const JobOfferEntries(),
  });

  List<String> get propertyNames => JobOfferEntries.properties;
  List<String> get sortDirection => JobOfferEntries.sortDirection;
  Map<String, List<String>> get recruitmentFilter => JobOfferEntries.recruitmentFilter;
  Map<String, List<String>> get freelanceFilter => JobOfferEntries.freelanceFilter;

  List<dynamic> get allActiveFilters => entries.allActiveFilters();

  JobOffersState copyWith({
    JobOffersStatus? status,
    List<JobOffer>? jobOffers,
    bool? hasMore,
    String? nextCursor,
    String? errorMessage,
    JobOfferEntries? entries,
  }) {
    return JobOffersState(
      status: status ?? this.status,
      jobOffers: jobOffers ?? this.jobOffers,
      hasMore: hasMore ?? this.hasMore,
      nextCursor: nextCursor ?? this.nextCursor,
      errorMessage: errorMessage ?? this.errorMessage,
      entries: entries ?? this.entries,
    );
  }

  @override
  List<Object?> get props => [
    status,
    jobOffers,
    hasMore,
    nextCursor,
    errorMessage,
    entries,
  ];
}