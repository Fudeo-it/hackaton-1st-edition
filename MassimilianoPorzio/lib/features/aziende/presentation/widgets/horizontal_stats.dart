import 'package:flutter/material.dart';

import 'annunci_recenti_aziende.dart';
import 'stats_annunci_aziende.dart';
import 'stats_aziende.dart';

class HorizontalStats extends StatelessWidget {
  const HorizontalStats(
      {super.key, required this.mWidth, required this.mHeigth});
  final double mWidth;
  final double mHeigth;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 0.4 * mHeigth,
      width: 0.4 * mWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StatAnnunci(
            orientation: Orientation.landscape,
            mWidth: mWidth,
          ),
          Container(
            // color: Colors.lime,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatAziende(
                    mWidth: mWidth,
                    orientation: Orientation.landscape,
                  ),
                  AnnunciRecenti(
                      mWidth: mWidth, orientation: Orientation.landscape)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
