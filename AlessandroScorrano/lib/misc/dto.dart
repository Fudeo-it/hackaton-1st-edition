import 'package:annunci_lavoro_flutter/models/matadata.dart';
import 'package:equatable/equatable.dart';

abstract class DTO extends Equatable {
  ///
  /// classe astratta per gesrtire i DTO
  ///
  final AdsMetaData metadata;
  final String adsTitle;
  final String applyLink;
  final List<dynamic> adsDescription;
  final DateTime postedDate;
  final String adsUrl;
  const DTO({
    required this.metadata,
    required this.adsTitle,
    required this.applyLink,
    required this.adsDescription,
    required this.postedDate,
    required this.adsUrl,
  });

  /// riotrna una [String] dagli oggetti select di Notion
  static String? getSelectObject(dynamic data) {
    if (data == null) {
      return null;
    } else {
      return (data as Map<String, dynamic>)['name'];
    }
  }

  /// riotorna il testo dall'oggetto Richtext di notion.
  static String? getSingleText(Map<String, dynamic> data) {
    String? dataReturn;
    if (data.containsKey('rich_text')) {
      (data['rich_text'] as List).forEach(
        (item) => dataReturn = item['plain_text'],
      );
      return dataReturn;
    } else if (data.containsKey('title')) {
      (data['title'] as List).forEach((item) {
        dataReturn = item['plain_text'];
        return;
      });
      return dataReturn;
    }
    return null;
  }

  @override
  List<Object?> get props => [
        metadata,
        adsTitle,
        applyLink,
        adsDescription,
      ];
}
