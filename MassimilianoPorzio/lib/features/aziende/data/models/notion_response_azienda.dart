import 'package:job_app/features/aziende/data/models/annuncio_azienda_model.dart';

class NotionResponseAziendaDTO {
  bool hasMore;
  String? nextCursor;
  List<AnnuncioAziendaModel> listaAnnunci;

  factory NotionResponseAziendaDTO.empty() => NotionResponseAziendaDTO(
        hasMore: false,
        listaAnnunci: [],
      );

  NotionResponseAziendaDTO({
    this.hasMore = true,
    this.nextCursor,
    required this.listaAnnunci,
  });

  bool get isEmpty => listaAnnunci.isEmpty;
}
