part of 'annuncio_bloc.dart';

abstract class AnnuncioEvent extends Equatable {
  const AnnuncioEvent();

  @override
  List<Object> get props => [];
}

class FetchAnnuncioEvent extends AnnuncioEvent {}

class AnnuncioFavoriteEventToggle extends AnnuncioEvent {
  final AnnuncioModel annuncioModel;
  AnnuncioFavoriteEventToggle(this.annuncioModel);
}

class AnnuncioQueryEvent extends AnnuncioEvent {
  final List<Filtro> query;
  AnnuncioQueryEvent(this.query);
}

class ResetFiltriAnnunciEvent extends AnnuncioEvent {
  final List<Filtro> query;
ResetFiltriAnnunciEvent(this.query);
}
