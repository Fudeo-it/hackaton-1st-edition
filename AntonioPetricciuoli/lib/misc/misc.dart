import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

abstract class Misc {
  static RegExp get emailRegExp => RegExp(
        r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
      );

  static Future<void> openUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  static String parseDate(String date, {String format = 'dd/MM/yyyy'}) {
    final DateTime dateTime = DateTime.parse(date);
    final String day = dateTime.day.toString().padLeft(2, '0');
    final String month = dateTime.month.toString().padLeft(2, '0');
    final String year = dateTime.year.toString().padLeft(4, '0');
    return '$day/$month/$year';
  }
}
