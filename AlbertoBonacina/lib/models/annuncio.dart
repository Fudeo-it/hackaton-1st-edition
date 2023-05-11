import 'package:soluzione1_hackathon_fudeo_flutter/models/descrizione.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_page.dart';

class Annuncio {
  late String title;
  String contrattoName = '';
  String contrattoColor = '';
  String teamName = '';
  String teamColor = '';
  late String aziendaName;
  String seniorityName = '';
  String seniorityColor = '';
  late String url; //
  String retribuzione = '';
  List<Descrizione> descrizioneList = [];
  String hrefOfferta = '';
  String localita = '';
  late DateTime createdTime;
  late DateTime lastEditedTime;

  Annuncio();

  Annuncio.fromNotionPage(NotionPage notionPage) {
    title = notionPage.properties!["Name"]!.title!.first.plainText != null
        ? notionPage.properties!["Name"]!.title!.first.plainText!
            .split("|")[0]
            .trim()
        : (notionPage.properties!["Name"]!.title!.first.text != null
            ? notionPage.properties!["Name"]!.title!.first.text!.content
                .split("|")[0]
                .trim()
            : "");

    aziendaName = notionPage
            .properties!["Nome azienda"]!.richText!.first.plainText ??
        notionPage.properties!["Nome azienda"]!.richText!.first.text!.content;

    if (notionPage.properties!["Contratto"]!.select != null) {
      contrattoName = notionPage.properties!["Contratto"]!.select!.name;
      contrattoColor = notionPage.properties!["Contratto"]!.select!.color;
    }

    if (notionPage.properties!["Team"]!.select != null) {
      teamName = notionPage.properties!["Team"]!.select!.name;
      teamColor = notionPage.properties!["Team"]!.select!.color;
    }

    if (notionPage.properties!["Seniority"]!.select != null) {
      seniorityName = notionPage.properties!["Seniority"]!.select!.name;
      seniorityColor = notionPage.properties!["Seniority"]!.select!.color;
    }

    if (notionPage.properties!["Retribuzione"]!.richText!.isNotEmpty) {
      retribuzione = notionPage
              .properties!["Retribuzione"]!.richText!.first.plainText ??
          notionPage.properties!["Retribuzione"]!.richText!.first.text!.content;
    }

    if (notionPage.properties!["Descrizione offerta"]!.richText!.isNotEmpty) {
      descrizioneList = notionPage.properties!["Descrizione offerta"]!.richText!
          .map((single) => Descrizione.fromNotionPropertyText(single))
          .toList();
    }

    if (notionPage.properties!["Come candidarsi"]!.richText!.isNotEmpty) {
      hrefOfferta = notionPage
              .properties!["Come candidarsi"]!.richText!.first.href ??
          notionPage.properties!["Come candidarsi"]!.richText!.first.plainText!;
    }

    if (notionPage.properties!["Località"]!.richText!.isNotEmpty) {
      localita =
          notionPage.properties!["Località"]!.richText!.first.plainText ??
              notionPage.properties!["Località"]!.richText!.first.text!.content;
    }

    createdTime = DateTime.parse(notionPage.createdTime);
    lastEditedTime = DateTime.parse(notionPage.lastEditedTime);
  }
}
