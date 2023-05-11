import 'package:flutter/material.dart';
import 'package:job_app/features/freelancers/presentation/widgets/annunci_recenti_freelancers.dart';

import 'stats_annunci_freelancers.dart';

class HorizontalStatsFreelancers extends StatelessWidget {
  const HorizontalStatsFreelancers(
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StatAnnunciFreelancers(
            orientation: Orientation.landscape,
            mWidth: mWidth,
          ),
          Container(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnnunciRecentiFreelancers(
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
