class AnnuncioFreelanceModel {
  final String id;
  final String emoji;
  final DateTime jobPosted;
  final String comeCandidarsi;
  final String richiestaDiLavoro;
  final String? budget;
  final String? nda;
  final String codice;
  final String? tempisticheDiPagamento;
  final String descrizioneDelProgetto;
  final String? tipoDiRelazione;
  final String? tempistiche;
  final String? url;
  bool inFavoritePage;

  AnnuncioFreelanceModel(
      {
      required this.id,
      required this.emoji,
      required this.jobPosted,
      required this.comeCandidarsi,
      required this.richiestaDiLavoro,
      required this.budget,
      required this.nda,
      required this.codice,
      required this.tempisticheDiPagamento,
      required this.descrizioneDelProgetto,
      required this.tipoDiRelazione,
      required this.tempistiche,
      required this.url,
      this.inFavoritePage = false,});

  factory AnnuncioFreelanceModel.fromMap(Map<String, dynamic> map) {
    final id = map["id"];
    final emoji = map["icon"]["emoji"];
    final jobPosted =
        DateTime.parse(map["properties"]["Job Posted"]["created_time"]);
    final comeCandidarsi =
        map["properties"]["Come candidarsi"]['rich_text'][0]['plain_text'];
    final richiestaDiLavoro =
        List.from(map["properties"]["Richiesta di lavoro"]['rich_text'])
            .map((map) {
      return map['plain_text'];
    }).join();
    final budget = map["properties"]["Budget"]['rich_text'].isEmpty
        ? " - "
        : map["properties"]["Budget"]['rich_text'][0]['plain_text'];
    final nda = map["properties"]["NDA"]["select"] == null
        ? " - "
        : map["properties"]["NDA"]["select"]["name"];
    final codice = map["properties"]["Codice"]['title'][0]['plain_text'];
    final tempisticheDiPagamento =
        map["properties"]["Tempistiche di pagamento"]['rich_text'].isEmpty
            ? " - "
            : map["properties"]["Tempistiche di pagamento"]['rich_text'][0]
                ['plain_text'];
    final descrizioneDelProgetto =
        map["properties"]["Descrizione del progetto"]['rich_text'].isEmpty
            ? " - "
            : map["properties"]["Descrizione del progetto"]['rich_text'][0]
                ['plain_text'];
    final tipoDiRelazione =
        map["properties"]["Tipo di relazione"]["select"] == null
            ? " - "
            : map["properties"]["Tipo di relazione"]["select"]["name"];
    final tempistiche = map["properties"]["Tempistiche"]['rich_text'].isEmpty
        ? " - "
        : map["properties"]["Tempistiche"]['rich_text'][0]['plain_text'];
    final url = map["url"];

    return AnnuncioFreelanceModel(
      id: id,
      emoji: emoji,
      jobPosted: jobPosted,
      comeCandidarsi: comeCandidarsi,
      richiestaDiLavoro: richiestaDiLavoro,
      budget: budget,
      nda: nda,
      codice: codice,
      tempisticheDiPagamento: tempisticheDiPagamento,
      descrizioneDelProgetto: descrizioneDelProgetto,
      tipoDiRelazione: tipoDiRelazione,
      tempistiche: tempistiche,
      url: url,
      inFavoritePage: false,
    );
  }
}
