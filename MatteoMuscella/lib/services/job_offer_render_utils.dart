import 'package:intl/intl.dart';

import '../models/app_models.dart';

class JobOfferRenderUtils {
  static String parsePlainText(String type, dynamic node) {
    if (node is Iterable) {
      return node.map((n) => n['plain_text']).join(' ');
    }
    return '';
  }

  static String parseSelect(String notionType, dynamic node) {
    if (node == null) {
      return '';
    }
    return node['name'] ?? '';
  }

  static String parseCreatedTime(String notionType, dynamic node, String locale) {
    if (node == null) {
      return '';
    }
    return DateFormat.yMd(locale).format(DateTime.parse(node));
  }

  static int jsonPropSorter(NotionApiProp a, NotionApiProp b) {
    var propOrder = [
      'title',
      'created_time',
      'select',
      'rich_text',
      'url',
    ];
    return propOrder
        .indexOf(a.node['type'])
        .compareTo(propOrder.indexOf(b.node['type']));
  }
}
