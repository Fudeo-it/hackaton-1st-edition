import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JobDTO extends Equatable {
  final PropertiesDTO properties;

  const JobDTO({
    required this.properties,
  });

  factory JobDTO.fromJson(Map<String, dynamic> data) => JobDTO(
        properties: PropertiesDTO.fromJson(data['properties']),
      );

  @override
  List<Object?> get props => [properties];
}

class PropertiesDTO extends Equatable {
  final JobPostedDTO jobPosted;
  final SelectDTO team;
  final SelectDTO contratto;
  final SelectDTO seniority;
  final int? ral;
  final NameDTO name;
  final RichTextDTO qualifica;
  final RetribuzioneDTO retribuzione;
  final DescrizioneOffertaDTO descrizioneOfferta;
  final String comeCandidarsi;
  final RichTextDTO localita;
  final String nomeAzienda;
  final RichTextDTO statoPubblicazione;
  final String? urlSitoWeb;

  const PropertiesDTO({
    required this.jobPosted,
    required this.team,
    required this.contratto,
    required this.seniority,
    required this.ral,
    required this.name,
    required this.qualifica,
    required this.retribuzione,
    required this.descrizioneOfferta,
    required this.comeCandidarsi,
    required this.localita,
    required this.nomeAzienda,
    required this.statoPubblicazione,
    required this.urlSitoWeb,
  });

  factory PropertiesDTO.fromJson(Map<String, dynamic> data) => PropertiesDTO(
        jobPosted: JobPostedDTO.fromJson(data['Job Posted']),
        team: SelectDTO.fromJson(data['Team']),
        contratto: SelectDTO.fromJson(data['Contratto']),
        seniority: SelectDTO.fromJson(data['Seniority']),
        ral: data['RAL']['select'],
        name: NameDTO.fromJson(data['Name']),
        qualifica: RichTextDTO.fromJson(data['Qualifica']),
        retribuzione: RetribuzioneDTO.fromJson(data['Retribuzione']),
        descrizioneOfferta:
            DescrizioneOffertaDTO.fromJson(data['Descrizione offerta']),
        comeCandidarsi: data['Come candidarsi']['rich_text'][0]['text']
            ['content'],
        localita: RichTextDTO.fromJson(data['Località']),
        nomeAzienda: data['Nome azienda']['rich_text'][0]['text']['content'],
        statoPubblicazione:
            RichTextDTO.fromJson(data['Stato di pubblicazione']),
        urlSitoWeb: data['URL sito web']['url'],
      );

  @override
  List<Object?> get props => [
        jobPosted,
        team,
        contratto,
        seniority,
        ral,
        name,
        qualifica,
        retribuzione,
        descrizioneOfferta,
        comeCandidarsi,
        localita,
        nomeAzienda,
        statoPubblicazione,
        urlSitoWeb,
      ];
}

class JobPostedDTO extends Equatable {
  final DateTime createdTime;

  const JobPostedDTO({required this.createdTime});

  factory JobPostedDTO.fromJson(Map<String, dynamic> data) => JobPostedDTO(
        createdTime:
            DateFormat('yyyy-MM-ddTHH:mm:ss.000Z').parse(data['created_time']),
      );

  @override
  List<Object?> get props => [createdTime];
}

class SelectDTO extends Equatable {
  final String? select;

  const SelectDTO({required this.select});

  factory SelectDTO.fromJson(Map<String, dynamic> data) {
    return SelectDTO(
        select: data['select'] == null ? null : data['select']['name']);
  }

  @override
  List<Object?> get props => [select];
}

class DescrizioneOffertaDTO extends Equatable {
  final EasyRichText text;

  const DescrizioneOffertaDTO({required this.text});

  factory DescrizioneOffertaDTO.fromJson(Map<String, dynamic> data) {
    List<dynamic> dinamo = (data['rich_text']);

    List<String> listaTestoDescrizione =
        dinamo.map((e) => (e['text']['content']).toString()).toList();

    List<dynamic>? annotations = dinamo.map((e) => e['annotations']).toList();
    List<bool> bold = annotations.map((e) => e['bold'] as bool).toList();
    List<bool> italic = annotations.map((e) => e['italic'] as bool).toList();
    List<bool> strikethrough =
        annotations.map((e) => e['strikethrough'] as bool).toList();
    List<bool> underline =
        annotations.map((e) => e['underline'] as bool).toList();
    List<bool> code = annotations.map((e) => e['code'] as bool).toList();
    List<String> color = annotations.map((e) => e['color'] as String).toList();
    List<EasyRichTextPattern> patternTestoRicco = List.generate(
      dinamo.length,
      (index) => EasyRichTextPattern(
        targetString: listaTestoDescrizione[index],
        style: TextStyle(
          fontWeight: bold[index] == true ? FontWeight.bold : FontWeight.normal,
          fontStyle:
              italic[index] == true ? FontStyle.italic : FontStyle.normal,
          decoration: underline[index] == true
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ),
    );

    EasyRichText testoRicco = EasyRichText(
      listaTestoDescrizione.toString(),
      patternList: patternTestoRicco,
    );

    return DescrizioneOffertaDTO(text: testoRicco);
  }

  @override
  List<Object?> get props => [text];
}

class NameDTO extends Equatable {
  final String text;

  const NameDTO({required this.text});

  factory NameDTO.fromJson(Map<String, dynamic> data) {
    List<dynamic> dinamo = data['title'];
    String testo = dinamo[0]['plain_text'];

    return NameDTO(text: testo);
  }

  @override
  List<Object?> get props => [text];
}

class RetribuzioneDTO extends Equatable {
  final String? text;

  const RetribuzioneDTO({required this.text});

  factory RetribuzioneDTO.fromJson(Map<String, dynamic> data) {
    String? testo;
    List<dynamic> dinamo = data['rich_text'];
    if (dinamo.isNotEmpty) {
      testo = dinamo[0]['text']['content'];
    } else {
      testo = null;
    }

    return RetribuzioneDTO(text: testo);
  }

  @override
  List<Object?> get props => [text];
}

class RichTextDTO extends Equatable {
  final String? text;

  const RichTextDTO({required this.text});

  factory RichTextDTO.fromJson(Map<String, dynamic> data) {
    String? testo;
    List<dynamic> dinamo = data['rich_text'];
    if (dinamo.isNotEmpty) {
      testo = dinamo[0]['text']['content'];
    } else {
      testo = null;
    }

    return RichTextDTO(text: testo);
  }

  @override
  List<Object?> get props => [text];
}
