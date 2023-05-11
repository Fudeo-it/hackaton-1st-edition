import 'package:soluzione1_hackathon_fudeo_flutter/models/descrizione.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_page.dart';

class Progetto {
  late String title;
  List<Descrizione> richiestaList = [];
  List<Descrizione> descrizioneList = [];
  List<Descrizione> budgetList = [];
  List<Descrizione> tempisticheList = [];
  List<Descrizione> tempistichePagamentoList = [];
  String hrefProgetto = '';
  String ndaName = '';
  String ndaColor = '';
  String tipoRelazioneName = '';
  String tipoRelazioneColor = '';
  late DateTime createdTime;
  late DateTime lastEditedTime;

  Progetto();

  Progetto.fromNotionPage(NotionPage notionPage) {
    title = notionPage.properties!["Codice"]!.title!.first.plainText != null
        ? notionPage.properties!["Codice"]!.title!.first.plainText!
            .split("|")[0]
            .trim()
        : (notionPage.properties!["Codice"]!.title!.first.text != null
            ? notionPage.properties!["Codice"]!.title!.first.text!.content
                .split("|")[0]
                .trim()
            : "");

    if (notionPage.properties!["Richiesta di lavoro"]!.richText!.isNotEmpty) {
      richiestaList = notionPage.properties!["Richiesta di lavoro"]!.richText!
          .map((single) => Descrizione.fromNotionPropertyText(single))
          .toList();
    }

    if (notionPage
        .properties!["Descrizione del progetto"]!.richText!.isNotEmpty) {
      descrizioneList = notionPage
          .properties!["Descrizione del progetto"]!.richText!
          .map((single) => Descrizione.fromNotionPropertyText(single))
          .toList();
    }

    if (notionPage.properties!["Budget"]!.richText!.isNotEmpty) {
      budgetList = notionPage.properties!["Budget"]!.richText!
          .map((single) => Descrizione.fromNotionPropertyText(single))
          .toList();
    }

    if (notionPage.properties!["Tempistiche"]!.richText!.isNotEmpty) {
      tempisticheList = notionPage.properties!["Tempistiche"]!.richText!
          .map((single) => Descrizione.fromNotionPropertyText(single))
          .toList();
    }

    if (notionPage
        .properties!["Tempistiche di pagamento"]!.richText!.isNotEmpty) {
      tempistichePagamentoList = notionPage
          .properties!["Tempistiche di pagamento"]!.richText!
          .map((single) => Descrizione.fromNotionPropertyText(single))
          .toList();
    }

    if (notionPage.properties!["Come candidarsi"]!.richText!.isNotEmpty) {
      hrefProgetto = notionPage
              .properties!["Come candidarsi"]!.richText!.first.href ??
          notionPage.properties!["Come candidarsi"]!.richText!.first.plainText!;
    }

    if (notionPage.properties!["NDA"]!.select != null) {
      ndaName = notionPage.properties!["NDA"]!.select!.name;
      ndaColor = notionPage.properties!["NDA"]!.select!.color;
    }

    if (notionPage.properties!["Tipo di relazione"]!.select != null) {
      tipoRelazioneName =
          notionPage.properties!["Tipo di relazione"]!.select!.name;
      tipoRelazioneColor =
          notionPage.properties!["Tipo di relazione"]!.select!.color;
    }

    createdTime = DateTime.parse(notionPage.createdTime);
    lastEditedTime = DateTime.parse(notionPage.lastEditedTime);
  }
}
