part of 'annuncio_cubit.dart';

class AnnuncioState extends Equatable {
  final Annuncio? annuncio;
  const AnnuncioState({
    this.annuncio,
  });
  factory AnnuncioState.initial() => const AnnuncioState();
  @override
  List<Object?> get props => [annuncio];
  @override
  bool? get stringify => true;

  AnnuncioState copyWith({
    Annuncio? annuncio,
  }) {
    return AnnuncioState(
      annuncio: annuncio ?? this.annuncio,
    );
  }
}
