import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_offer_repository/job_offer_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

typedef OpenJobOfferCallback = void Function(JobOffer jobOffer);
typedef OpenFreelanceCallback = void Function(Freelance freelance);

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required JobOfferRepository jobOfferRepository,
    required OpenJobOfferCallback openJobOfferDetailPage,
    required OpenFreelanceCallback openFreelanceDetailPage,
  })  : _openFreelanceDetailPage = openFreelanceDetailPage,
        _openJobOfferDetailPage = openJobOfferDetailPage,
        super(HomeInitial()) {
    on<HomeJobOffersChanged>(_handleJobOffersChanged);
    on<HomeFreelanceProjectsChanged>(_handleFreelanceProjectsChanged);
    on<HomeOpportunityTap>(_handleOpportunityTap);

    jobOfferRepository.jobOfferList.listen((event) {
      add(HomeJobOffersChanged(event));
    });
    jobOfferRepository.freelanceList.listen((event) {
      add(HomeFreelanceProjectsChanged(event));
    });

    jobOfferRepository
      ..loadFreelanceProjects()
      ..loadJobOffers();
  }

  final OpenFreelanceCallback _openFreelanceDetailPage;
  final OpenJobOfferCallback _openJobOfferDetailPage;

  void _handleJobOffersChanged(
    HomeJobOffersChanged event,
    Emitter<HomeState> emit,
  ) {
    if (state is HomeFreelanceProjectsLoaded) {
      emit(
        (state as HomeFreelanceProjectsLoaded).loadJobOffers(event.jobOffers),
      );
    } else if (state is HomeInitial) {
      emit((state as HomeInitial).loadJobOffers(event.jobOffers));
    }
  }

  void _handleFreelanceProjectsChanged(
    HomeFreelanceProjectsChanged event,
    Emitter<HomeState> emit,
  ) {
    if (state is HomeJobOffersLoaded) {
      emit(
        (state as HomeJobOffersLoaded)
            .loadFreelanceProjects(event.freelanceProjects),
      );
    } else if (state is HomeInitial) {
      emit(
        (state as HomeInitial).loadFreelanceProjects(event.freelanceProjects),
      );
    }
  }

  void _handleOpportunityTap(
    HomeOpportunityTap event,
    Emitter<HomeState> emit,
  ) {
    if (state is HomeSuccess) {
      final state = this.state as HomeSuccess;
      final id = event.opportunity.id;
      final isJobOffer = state.jobOffers.any((element) => element.id == id);
      if (isJobOffer) {
        _openJobOfferDetailPage(
          state.jobOffers.firstWhere(
            (element) => element.id == id,
          ),
        );
      } else {
        _openFreelanceDetailPage(
          state.freelanceProjects.firstWhere(
            (element) => element.id == id,
          ),
        );
      }
    }
  }
}
