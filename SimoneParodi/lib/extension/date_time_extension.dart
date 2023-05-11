import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatted => DateFormat('dd/MM/yyyy HH:mm').format(this);
}
