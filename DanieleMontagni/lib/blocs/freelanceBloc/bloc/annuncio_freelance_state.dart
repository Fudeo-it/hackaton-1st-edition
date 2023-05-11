part of 'annuncio_freelance_bloc.dart';

abstract class AnnuncioFreelanceState extends Equatable {
  const AnnuncioFreelanceState();

  @override
  List<Object> get props => [];
}

class FetchingAnnuncioFreelanceState extends AnnuncioFreelanceState {}

class NoAnnuncioFreelanceState extends AnnuncioFreelanceState {}

class ErrorAnnuncioFreelanceState extends AnnuncioFreelanceState {}

class FetchedAnnuncioFreelanceState extends AnnuncioFreelanceState {
  final List<AnnuncioFreelanceModel> annunci;

   FetchedAnnuncioFreelanceState(this.annunci);

  @override
  List<Object> get props => [annunci];
}
