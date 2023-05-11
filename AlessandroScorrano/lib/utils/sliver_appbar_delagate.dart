import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  ///
  /// delagate utilizzato per mostrare la barra degli strumenti nelle tab.
  ///
  /// diventa visibile ogni volta che si inizia a scrollare verso l'alto.
  ///
  /// ha un effetto blur per mostrare in semitrasparenza la grafica sottostante.
  ///

  final double minHeight;
  final double maxHeight;
  final Widget child;
  final Color color;
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
    required this.color,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.5),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              child: SizedBox.expand(child: child),
            ),
          ),
        ));
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
