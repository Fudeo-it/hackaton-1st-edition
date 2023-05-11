part of 'annuncio_bloc.dart';

abstract class AnnuncioState extends Equatable {
  const AnnuncioState();
  
  @override
  List<Object> get props => [];
}

class FetchingAnnuncioState extends AnnuncioState {}

class NoAnnuncioState extends AnnuncioState {}

class ErrorAnnuncioState extends AnnuncioState {}

class FetchedAnnuncioState extends AnnuncioState {
  final List<AnnuncioModel> annunci;

   FetchedAnnuncioState(this.annunci);

  @override
  List<Object> get props => [annunci];
}

 