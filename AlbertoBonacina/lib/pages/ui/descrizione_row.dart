import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/descrizione.dart';

class DescrizioneRow extends StatelessWidget {
  const DescrizioneRow({super.key, required this.rowsList});

  final List<Descrizione> rowsList;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return RichText(
      text: TextSpan(
        text: "",
        children: rowsList.map(
          (single) {
            return TextSpan(
              text: single.text,
              style: GoogleFonts.poppins(
                color: colorScheme.onBackground,
                fontWeight: single.isBold ? FontWeight.bold : FontWeight.normal,
                fontStyle:
                    single.isItalic ? FontStyle.italic : FontStyle.normal,
                fontSize: 18,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
