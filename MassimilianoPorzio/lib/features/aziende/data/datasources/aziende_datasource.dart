import 'package:job_app/features/aziende/data/models/notion_response_azienda.dart';

import 'package:job_app/features/aziende/domain/usecases/annunci_azienda_params.dart';

abstract class AziendeDatasource {
  Future<NotionResponseAziendaDTO> fetchAnnunci();
  Future<NotionResponseAziendaDTO> fetchPrimaPaginaAnnunci(
      AnnunciAzParams params);
  Future<NotionResponseAziendaDTO> fetchProssimaPaginaAnnunci(
      String startCursor, AnnunciAzParams params);
  Future<NotionResponseAziendaDTO> fetchAnnuncio(String annuncioId);
}
