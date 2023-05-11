part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];

  HomeState loadJobOffers(List<JobOffer> jobOffers) {
    return HomeJobOffersLoaded(jobOffers);
  }

  HomeState loadFreelanceProjects(List<Freelance> freelanceProjects) {
    return HomeFreelanceProjectsLoaded(freelanceProjects);
  }
}

class HomeJobOffersLoaded extends HomeState {
  const HomeJobOffersLoaded(this.jobOffers);

  final List<JobOffer> jobOffers;

  @override
  List<Object> get props => [jobOffers];

  HomeState loadFreelanceProjects(List<Freelance> freelanceProjects) {
    return HomeSuccess(jobOffers, freelanceProjects);
  }
}

class HomeFreelanceProjectsLoaded extends HomeState {
  const HomeFreelanceProjectsLoaded(this.freelanceProjects);

  final List<Freelance> freelanceProjects;

  @override
  List<Object> get props => [freelanceProjects];

  HomeState loadJobOffers(List<JobOffer> jobOffers) {
    return HomeSuccess(jobOffers, freelanceProjects);
  }
}

class HomeSuccess extends HomeState {
  const HomeSuccess(this.jobOffers, this.freelanceProjects);

  final List<JobOffer> jobOffers;
  final List<Freelance> freelanceProjects;

  List<Opportunity> get opportunities {
    final merged = <Opportunity>[
      ...jobOffers.map(Opportunity.fromJobOffer),
      ...freelanceProjects.map(Opportunity.fromFreelance),
    ];
    // ignore: cascade_invocations
    merged.sort((a, b) {
      return a.publishDate.compareTo(b.publishDate);
    });
    return merged.take(3).toList();
  }

  @override
  List<Object> get props => [jobOffers, freelanceProjects];
}

class Opportunity extends Equatable {
  const Opportunity({
    required this.id,
    required this.title,
    required this.workWithOrFor,
    required this.features,
    required this.type,
    required this.publishDate,
  });
  factory Opportunity.fromJobOffer(JobOffer jobOffer) {
    return Opportunity(
      id: jobOffer.id,
      title: jobOffer.title,
      workWithOrFor: jobOffer.company,
      features: [
        stringFromContract(jobOffer.contract),
        jobOffer.location,
      ],
      type: OpportunityType.jobOffer,
      publishDate: jobOffer.publishDate,
    );
  }

  factory Opportunity.fromFreelance(Freelance freelance) {
    return Opportunity(
      id: freelance.id,
      title: freelance.title,
      workWithOrFor: freelance.workWith,
      features: [
        freelance.compensation,
        if (freelance.nda) 'NDA' else 'No NDA',
      ],
      type: OpportunityType.freelanceProject,
      publishDate: freelance.publishDate,
    );
  }

  final String id;
  final String title;
  final String workWithOrFor;
  final List<String> features;
  final OpportunityType type;
  final DateTime publishDate;

  @override
  List<Object?> get props => [
        id,
        title,
        workWithOrFor,
        features,
        type,
        publishDate,
      ];
}

enum OpportunityType {
  jobOffer,
  freelanceProject,
}
