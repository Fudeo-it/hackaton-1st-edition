import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class RichTextDescription extends Equatable {
  ///
  /// classe che si occupa di parsificare gli oggetti RichText ritornati da notion.
  ///
  /// riceve una lista di tipo dynamic e tramite i metodi privati nel costruttore inizializza gli altri attributi
  /// [descriptiontText] la stringa intera.
  /// [descriptionAnnotations]lista di [Map] che contiene le annotazioni di ogni stringa del richtext.
  ///
  final List<dynamic> data;
  late String descriptionText;
  late List<Map<String, dynamic>> descriptionAnnotations;

  RichTextDescription({required this.data}) {
    descriptionText = _getDescriptionText(data);
    descriptionAnnotations = _getAnnotations(data);
  }

  /// metodo che ritorna la stringa intera.
  String _getDescriptionText(List<dynamic> data) {
    String description = '';
    data.map((item) => description += item['text']['content']).toString();
    return description;
  }

  /// metodo che ritorna una lista di [Map] contenente i criteri tipografici di ogni stringa.
  List<Map<String, dynamic>> _getAnnotations(List<dynamic> data) {
    List<Map<String, dynamic>> annotations = [];
    data.forEach((item) {
      annotations.add(
        {'text': item['text']['content'], 'annotations': item['annotations']},
      );
    });
    return annotations;
  }

  @override
  List<Object?> get props => [
        data,
        descriptionText,
        descriptionAnnotations,
      ];
}
