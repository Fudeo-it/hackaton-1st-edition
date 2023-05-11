part of 'annuncio_freelance_bloc.dart';

abstract class AnnuncioFreelanceEvent extends Equatable {
  const AnnuncioFreelanceEvent();

  @override
  List<Object> get props => [];
}

class FetchAnnuncioFreelanceEvent extends AnnuncioFreelanceEvent {

}

class AnnuncioFreelanceFavoriteEventToggle extends AnnuncioFreelanceEvent {
  final AnnuncioFreelanceModel annuncioFreelanceModel;
  AnnuncioFreelanceFavoriteEventToggle(this.annuncioFreelanceModel);
}
