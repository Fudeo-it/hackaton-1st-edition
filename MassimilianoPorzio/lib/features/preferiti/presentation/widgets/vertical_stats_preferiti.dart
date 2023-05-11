import 'package:flutter/material.dart';

import 'annunci_recenti_preferiti.dart';
import 'stats_annunci_preferiti.dart';

class VerticalStatsPreferiti extends StatelessWidget {
  const VerticalStatsPreferiti({
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
            child: StatAnnunciPreferiti(
              orientation: Orientation.portrait,
              mWidth: mWidth,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnnunciRecentiPreferiti(
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
