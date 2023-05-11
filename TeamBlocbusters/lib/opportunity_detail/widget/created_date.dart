import 'package:flutter/material.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class CreatedDate extends StatelessWidget {
  const CreatedDate({
    required this.date,
    super.key,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Text(
      timeago.format(date, locale: 'it'),
      style: AppFonts.jobDetailDate,
    );
  }
}
