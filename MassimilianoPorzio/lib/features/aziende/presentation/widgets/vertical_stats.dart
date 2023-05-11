import 'package:flutter/material.dart';

import 'annunci_recenti_aziende.dart';
import 'stats_annunci_aziende.dart';
import 'stats_aziende.dart';

class VerticalStats extends StatelessWidget {
  const VerticalStats({
    super.key,
    required this.mWidth,
    required this.mHeight,
  });

  final double mWidth;
  final double mHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.2 * mHeight,
      width: 0.9 * mWidth,
      //height: 160,
      // color: Colors.deepOrange,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: StatAnnunci(
              orientation: Orientation.portrait,
              mWidth: mWidth,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: StatAziende(
                      mWidth: mWidth,
                      orientation: Orientation.portrait,
                    ),
                  ),
                  AnnunciRecenti(
                    mWidth: mWidth,
                    orientation: Orientation.portrait,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
