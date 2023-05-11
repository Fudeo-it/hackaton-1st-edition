import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerWrapper extends StatelessWidget {
  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final double closedElevation;
  final Widget child;
  const OpenContainerWrapper({
    Key? key,
    required this.closedBuilder,
    required this.transitionType,
    this.closedElevation = 0.0,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      closedElevation: closedElevation,
      transitionType: transitionType,
      closedBuilder: closedBuilder,
      openBuilder: (context, _) => child,
      tappable: false,
      transitionDuration: const Duration(milliseconds: 400),
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      openShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
    );
  }
}
