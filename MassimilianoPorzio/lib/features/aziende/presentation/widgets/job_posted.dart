import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/annuncio_azienda.dart';

class JobPosted extends StatelessWidget {
  const JobPosted({
    super.key,
    required this.annuncio,
  });

  final AnnuncioAzienda annuncio;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.schedule_sharp,
          size: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          DateFormat('dd/MM/yyyy HH:mm').format(annuncio.jobPosted),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
