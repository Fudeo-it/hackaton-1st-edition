import 'package:flutter/material.dart';
import 'package:job_app/features/freelancers/presentation/widgets/annunci_recenti_freelancers.dart';

import 'stats_annunci_freelancers.dart';

class VerticalStatsFreelancers extends StatelessWidget {
  const VerticalStatsFreelancers({
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
            child: StatAnnunciFreelancers(
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
                  AnnunciRecentiFreelancers(
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
