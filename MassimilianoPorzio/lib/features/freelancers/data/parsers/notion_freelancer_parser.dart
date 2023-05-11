import 'package:dio/dio.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:job_app/app/resources/string_constants.dart';
import 'package:job_app/core/data/models/weblink_model.dart';
import 'package:job_app/features/freelancers/data/models/annuncio_freelancers_model.dart';
import 'package:job_app/features/freelancers/data/models/nda_model.dart';
import 'package:job_app/features/freelancers/data/models/relazione_model.dart';
import 'package:job_app/features/freelancers/domain/enums/nda.dart';
import 'package:job_app/features/freelancers/domain/enums/relazione.dart';

import '../../../../app/resources/app_consts.dart';
import '../../../../core/data/models/rich_text_annotation_model.dart';
import '../../../../core/data/models/rich_text_model.dart';
import '../../../../core/domain/enums/tipologia_annunci.dart';
import '../../../../core/domain/errors/exceptions.dart';

AnnuncioFreelancersModel parseNotionResponseSingoloAnnuncio(
    Map<String, dynamic> annuncioNotion) {
  try {
    var emojiParser = EmojiParser();
    final String id = annuncioNotion['id'];
    final String titolo;
    String? emoji;
    NdaModel? nda;
    RelazioneModel? relazione;
    final List<RichTextModel> tempistiche = [];
    final List<RichTextModel> tempistichePagamento = [];
    final List<RichTextModel> richiestaDiLavoro = [];
    final List<RichTextModel> descrizioneProgetto = [];
    final List<RichTextModel> budget = [];
    WebLinkModel comeCandidarsi;
    WebLinkModel? urlAnnuncio;
    final TipoAnnuncio tipoAnnuncio;
    if (annuncioNotion["parent"]["database_id"] ==
        StringConsts.notionDatabaseIdFreelancers) {
      tipoAnnuncio = TipoAnnuncio.freelancers;
    } else {
      tipoAnnuncio = TipoAnnuncio.aziende; //!NON DEVE SUCCEDERE
    }
    if (annuncioNotion.containsKey("icon")) {
      if (annuncioNotion["icon"]["type"] == "emoji") {
        try {
          emoji = emojiParser.getEmoji(annuncioNotion["icon"]["emoji"]).name;
        } on Exception {
          rethrow;
        }
      }
    } //fine se c'era l'icona
    //default false
    final bool archived = annuncioNotion.containsKey("archived")
        ? annuncioNotion["archived"] as bool
        : false;
    //*recupero le properties
    Map<String, dynamic> properties = annuncioNotion["properties"];
    //*data creazione annuncio
    final DateTime jobPosted =
        DateTime.parse(properties["Job Posted"]["created_time"] as String);
    //*NDA
    if (properties.containsKey(StringConsts.notionNda)) {
      Map<String, dynamic> mapNDA =
          properties[StringConsts.notionNda] as Map<String, dynamic>;
      if (mapNDA.containsKey("select")) {
        if (mapNDA["select"] != null) {
          String ndaName = mapNDA["select"]["name"] as String;
          String ndaColor = mapNDA["select"]["color"] as String;
          switch (ndaName) {
            case StringConsts.notionNdaNo:
              nda = NdaModel(nda: NDA.no, backgroundColorString: ndaColor);
              break;
            case StringConsts.notionNdaSi:
              nda = NdaModel(nda: NDA.si, backgroundColorString: ndaColor);
              break;
            default:
          }
        }
      }
    } //fine parsing NDA
    //*RELAZIONE
    if (properties.containsKey(StringConsts.notionRelazione)) {
      Map<String, dynamic> mapRelazione =
          properties[StringConsts.notionRelazione] as Map<String, dynamic>;
      if (mapRelazione.containsKey("select")) {
        if (mapRelazione["select"] != null) {
          String relazioneName = mapRelazione["select"]["name"] as String;
          String relazioneColor = mapRelazione["select"]["color"] as String;
          switch (relazioneName) {
            case StringConsts.notionRelazioneSolo:
              relazione = RelazioneModel(
                  relazione: Relazione.solo,
                  backgroundColorString: relazioneColor);
              break;
            case StringConsts.notioNRelazioneAltri:
              relazione = RelazioneModel(
                  relazione: Relazione.altri,
                  backgroundColorString: relazioneColor);
              break;
            default:
          }
        }
      }
    } //FINE PARSING RELAZIONE
    //*TITOLO ANNUNCIO ("CODICE")
    titolo = properties["Codice"]["title"][0]["plain_text"] as String;
    //*TEMPISTICHE - RICHTEXT
    if (properties.containsKey(StringConsts.notionTempistiche)) {
      List<dynamic> richText =
          properties[StringConsts.notionTempistiche]["rich_text"];
      //Giro la lista dei "token" da cui è composta la descr dell'offerta
      for (var token in richText) {
        //la prendo come mappa perché nel json è così
        token = token as Map<String, dynamic>;
        //per ora prendo solo i rich text di tipo testo
        if (token['type'] == "text") {
          String tokenPlainText = token["plain_text"] as String;
          //TODO fare metodo unico:
          RichTextAnnotationModel annotations = RichTextAnnotationModel(
              bold: token["annotations"]["bold"] as bool,
              italic: token["annotations"]["italic"] as bool,
              strikethrough: token["annotations"]["strikethrough"] as bool,
              underline: token["annotations"]["underline"] as bool,
              code: token["annotations"]["code"] as bool,
              colorString: token["annotations"]["color"] as String?);
          tempistiche.add(RichTextModel(
            plainText: tokenPlainText,
            annotation: annotations,
          ));
        } //fine if se il rich text è di tipo text
      } //fine giro dei token delle tempistiche
    } //fine parsing tempistiche
//*TEMPISTICHE DI PAGAMENTO - RICHTEXT
    if (properties.containsKey(StringConsts.notionTempisticheDiPagamento)) {
      List<dynamic> richText =
          properties[StringConsts.notionTempisticheDiPagamento]["rich_text"];
      //Giro la lista dei "token" da cui è composta la descr dell'offerta
      for (var token in richText) {
        //la prendo come mappa perché nel json è così
        token = token as Map<String, dynamic>;
        //per ora prendo solo i rich text di tipo testo
        if (token['type'] == "text") {
          String tokenPlainText = token["plain_text"] as String;
          //TODO fare metodo unico:
          RichTextAnnotationModel annotations = RichTextAnnotationModel(
              bold: token["annotations"]["bold"] as bool,
              italic: token["annotations"]["italic"] as bool,
              strikethrough: token["annotations"]["strikethrough"] as bool,
              underline: token["annotations"]["underline"] as bool,
              code: token["annotations"]["code"] as bool,
              colorString: token["annotations"]["color"] as String?);
          tempistichePagamento.add(RichTextModel(
            plainText: tokenPlainText,
            annotation: annotations,
          ));
        } //fine if se il rich text è di tipo text
      } //fine giro dei token delle tempistiche di pagamento
    } //fine parsing tempistiche di pagamento
//*RICHIESTA DI LAVORO - RICHTEXT
    if (properties.containsKey(StringConsts.notionRichiestaDiLavoro)) {
      List<dynamic> richText =
          properties[StringConsts.notionRichiestaDiLavoro]["rich_text"];
      //Giro la lista dei "token" da cui è composta la descr dell'offerta
      for (var token in richText) {
        //la prendo come mappa perché nel json è così
        token = token as Map<String, dynamic>;
        //per ora prendo solo i rich text di tipo testo
        if (token['type'] == "text") {
          String tokenPlainText = token["plain_text"] as String;
          //TODO fare metodo unico:
          RichTextAnnotationModel annotations = RichTextAnnotationModel(
              bold: token["annotations"]["bold"] as bool,
              italic: token["annotations"]["italic"] as bool,
              strikethrough: token["annotations"]["strikethrough"] as bool,
              underline: token["annotations"]["underline"] as bool,
              code: token["annotations"]["code"] as bool,
              colorString: token["annotations"]["color"] as String?);
          richiestaDiLavoro.add(RichTextModel(
            plainText: tokenPlainText,
            annotation: annotations,
          ));
        } //fine if se il rich text è di tipo text
      } //fine giro dei token della richiesta di lavoro
    }
//*DESCRIZIONE DEL PROGETTO - RICHTEXT
    if (properties.containsKey(StringConsts.notionDescrizioneProgetto)) {
      List<dynamic> richText =
          properties[StringConsts.notionDescrizioneProgetto]["rich_text"];
      //Giro la lista dei "token" da cui è composta la descr dell'offerta
      for (var token in richText) {
        //la prendo come mappa perché nel json è così
        token = token as Map<String, dynamic>;
        //per ora prendo solo i rich text di tipo testo
        if (token['type'] == "text") {
          String tokenPlainText = token["plain_text"] as String;
          //TODO fare metodo unico:
          RichTextAnnotationModel annotations = RichTextAnnotationModel(
              bold: token["annotations"]["bold"] as bool,
              italic: token["annotations"]["italic"] as bool,
              strikethrough: token["annotations"]["strikethrough"] as bool,
              underline: token["annotations"]["underline"] as bool,
              code: token["annotations"]["code"] as bool,
              colorString: token["annotations"]["color"] as String?);
          descrizioneProgetto.add(RichTextModel(
            plainText: tokenPlainText,
            annotation: annotations,
          ));
        } //fine if se il rich text è di tipo text
      } //fine giro dei token della descrizione del progetto
    }
    //*BUDGET - RICHTEXT
    if (properties.containsKey(StringConsts.notionBudget)) {
      List<dynamic> richText =
          properties[StringConsts.notionBudget]["rich_text"];
      //Giro la lista dei "token" da cui è composta la descr dell'offerta
      for (var token in richText) {
        //la prendo come mappa perché nel json è così
        token = token as Map<String, dynamic>;
        //per ora prendo solo i rich text di tipo testo
        if (token['type'] == "text") {
          String tokenPlainText = token["plain_text"] as String;
          //TODO fare metodo unico:
          RichTextAnnotationModel annotations = RichTextAnnotationModel(
              bold: token["annotations"]["bold"] as bool,
              italic: token["annotations"]["italic"] as bool,
              strikethrough: token["annotations"]["strikethrough"] as bool,
              underline: token["annotations"]["underline"] as bool,
              code: token["annotations"]["code"] as bool,
              colorString: token["annotations"]["color"] as String?);
          budget.add(RichTextModel(
            plainText: tokenPlainText,
            annotation: annotations,
          ));
        } //fine if se il rich text è di tipo text
      } //fine giro dei token della descrizione del progetto
    }
//*COME CANDIDARSI
    String? urlComeCandiarsi;
    if (properties["Come candidarsi"]["rich_text"][0]["href"] != null) {
      urlComeCandiarsi =
          properties["Come candidarsi"]["rich_text"][0]["href"] as String;
    }
    comeCandidarsi = WebLinkModel(
      content:
          properties["Come candidarsi"]["rich_text"][0]["plain_text"] as String,
      url: urlComeCandiarsi,
    ); //fine parsing come candidarsi
    //*URL ANNUNCIO
    if (annuncioNotion['url'] != null) {
      urlAnnuncio = WebLinkModel(
          content: annuncioNotion['url'], url: annuncioNotion['url']);
    }
    //*=====
    return AnnuncioFreelancersModel(
      id: id,
      titolo: titolo,
      archived: archived,
      tempistiche: tempistiche,
      tempistichePagamento: tempistichePagamento,
      richiestaDiLavoro: richiestaDiLavoro,
      descrizioneProgetto: descrizioneProgetto,
      budget: budget,
      jobPosted: jobPosted,
      comeCandidarsi: comeCandidarsi,
      tipoAnnuncio: tipoAnnuncio,
      emoji: emoji,
      nda: nda,
      relazione: relazione,
      urlAnnuncio: urlAnnuncio,
    );
  } catch (e) {
    throw ParsingException();
  }
}

List<AnnuncioFreelancersModel> parseNotionResponseFreelancers(
    Response response) {
  List<AnnuncioFreelancersModel> listaAnnunci = [];
  try {
    var emojiParser = EmojiParser(); //TODO con service locator...
    List annunciNotion = response.data["results"];
    for (Map<String, dynamic> annuncioNotion in annunciNotion) {
      var annuncioModel = parseNotionResponseSingoloAnnuncio(annuncioNotion);
      listaAnnunci.add(annuncioModel);
    } //fine giro sugli annunciNotion
    return listaAnnunci;
  } catch (e) {
    throw ParsingException();
  }
}
