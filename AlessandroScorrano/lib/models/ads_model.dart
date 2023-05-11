import 'package:annunci_lavoro_flutter/models/ads_description.dart';
import 'package:annunci_lavoro_flutter/models/matadata.dart';
import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
abstract class AdsModel extends Equatable {
  ///
  /// classe astratta da cui vengono creati gli oggetti di tipo
  /// [JobPosition] e [FreeLancePosition]
  ///
  /// mette a fattor comune gli attributi:
  ///
  /// [AdsMetaData] oggetto che contiene tutti i metadati.
  /// [adsTitle] titolo dell'annuncio.
  /// [adsDescription] contiene un oggetto di tipo [RichTextDescription] per gestire la descrizione dell'annuncio
  /// [applyLink] link della candidatura.
  /// [adsUrl] URL dell'annuncio utilizzato per la condivisione con app di terze parti.
  /// [postedDate] data di pubblicazione dell'annuncio.
  /// [isFavourite] variabile [bool] per segnalare se l'annuncio è tra i preferito o meno.
  ///
  final AdsMetaData metaData;
  final String adsTitle;
  final RichTextDescription adsDescription;
  final String applyLink;
  final String adsUrl;
  final DateTime postedDate;
  bool isFavourite;

  AdsModel({
    required this.metaData,
    required this.adsTitle,
    required this.adsDescription,
    required this.applyLink,
    required this.postedDate,
    required this.isFavourite,
    required this.adsUrl,
  });

  @override
  List<Object?> get props => [
        adsTitle,
        applyLink,
        adsDescription,
        postedDate,
      ];
}
