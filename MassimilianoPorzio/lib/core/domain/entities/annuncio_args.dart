import 'package:job_app/core/domain/enums/tipologia_annunci.dart';

class AnnuncioArguments {
  // final Annuncio annuncio;
  final String annuncioId;
  final TipoAnnuncio tipoAnnuncio;
  final bool isFromPreferiti;

  AnnuncioArguments(
      {required this.annuncioId,
      required this.tipoAnnuncio,
      this.isFromPreferiti = false});
}
