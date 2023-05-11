class AnnuncioModel {
  final String id;
  final String emoji;
  final DateTime jobPosted;
  final String? team;
  final String? contratto;
  final String? seniority;
  final String? retribuzione;
  final String titolo;
  final String descrizioneOfferta;
  final String comeCandidarsi;
  final String? luogo;
  final String nomeAzienda;
  final String? url;
  bool inFavoritePage;

  AnnuncioModel({
    required this.id,
    required this.emoji,
    required this.jobPosted,
    required this.titolo,
    required this.descrizioneOfferta,
    required this.comeCandidarsi,
    required this.nomeAzienda,
    required this.team,
    required this.contratto,
    required this.seniority,
    required this.retribuzione,
    required this.luogo,
    required this.url,
    this.inFavoritePage = false,
  });

  factory AnnuncioModel.fromMap(Map<String, dynamic> map) {
    final id = map["id"];
    final emoji = map["icon"]["emoji"];
    final jobPosted =
        DateTime.parse(map["properties"]["Job Posted"]["created_time"]);
    final team = map["properties"]["Team"]["select"] == null
        ? " - "
        : map["properties"]["Team"]["select"]["name"];
    final contratto = map["properties"]["Contratto"]["select"] == null
        ? " - "
        : map["properties"]["Contratto"]["select"]["name"];
    final seniority = map["properties"]["Seniority"]["select"] == null
        ? " - "
        : map["properties"]["Seniority"]["select"]["name"];
    final retribuzione = map["properties"]["Retribuzione"]['rich_text'].isEmpty
        ? " - "
        : map["properties"]["Retribuzione"]['rich_text'][0]['plain_text'];
    final titolo = map["properties"]["Name"]['title'][0]['plain_text'];
    final descrizioneOfferta =
        List.from(map["properties"]["Descrizione offerta"]['rich_text'])
            .map((map) {
      return map['plain_text'];
    }).join();
    final comeCandidarsi =
        map["properties"]["Come candidarsi"]['rich_text'][0]['plain_text'];
    final luogo = map["properties"]["Località"]['rich_text'].isEmpty
        ? " - "
        : map["properties"]["Località"]['rich_text'][0]['plain_text'];
    final nomeAzienda =
        map["properties"]["Nome azienda"]['rich_text'][0]['plain_text'];
    final url = map["url"];

    return AnnuncioModel(
      id: id,
      emoji: emoji,
      contratto: contratto,
      seniority: seniority,
      retribuzione: retribuzione,
      luogo: luogo,
      jobPosted: jobPosted,
      team: team,
      descrizioneOfferta: descrizioneOfferta,
      comeCandidarsi: comeCandidarsi,
      nomeAzienda: nomeAzienda,
      titolo: titolo,
      url: url,
      inFavoritePage: false,
    );
  }
}
