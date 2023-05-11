import 'package:flutter/material.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/descrizione.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/descrizione_row.dart';

class DescrizioneSection extends StatelessWidget {
  const DescrizioneSection(
      {super.key, required this.title, required this.rowsList});

  final String title;
  final List<Descrizione> rowsList;

  @override
  Widget build(BuildContext context) {
    if (rowsList.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              bottom: 16,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          DescrizioneRow(
            rowsList: rowsList,
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
