import 'package:flutter/material.dart';

import '../../domain/entities/annuncio_azienda.dart';

class Localita extends StatelessWidget {
  const Localita({
    super.key,
    required this.annuncio,
  });

  final AnnuncioAzienda annuncio;

  @override
  Widget build(BuildContext context) {
    String testoLocalita = "";
    if (annuncio.localita != null) {
      testoLocalita = annuncio.localita!.split("(")[0];

      if (testoLocalita.isEmpty) {
        testoLocalita = annuncio.localita!.split(",")[0];
      }
    }

    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (testoLocalita.isNotEmpty)
                  const Icon(
                    Icons.pin_drop,
                    size: 12,
                  ),
                Text(
                  testoLocalita,
                  textAlign: TextAlign.end,
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
