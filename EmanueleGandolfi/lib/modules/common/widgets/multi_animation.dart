import 'package:flutter/material.dart';

class MultiAnimation extends StatefulWidget {
  final Widget child;
  final AnimationController controller;
  final Offset beginOffset;
  final Offset endOffset;
  final double beginOpacity;
  final double endOpacity;
  final double beginInterval;
  final double endInterval;
  final Curve curve;

  const MultiAnimation({Key? key, required this.controller, required this.child,
    this.beginOffset = const Offset(0, 0.4), this.endOffset = Offset.zero,
    this.beginOpacity = 0, this.endOpacity = 1,
    this.beginInterval = 0, this.endInterval = 1,
    this.curve = Curves.easeInOut }) : super(key: key);

  @override
  State<MultiAnimation> createState() => _MultiAnimationState();
}

class _MultiAnimationState extends State<MultiAnimation> {
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();

    Curve curve = Interval(widget.beginInterval, widget.endInterval, curve: widget.curve);

    offsetAnimation = Tween<Offset>(begin: widget.beginOffset, end: widget.endOffset)
      .animate(CurvedAnimation(parent: widget.controller, curve: curve));

    opacityAnimation = Tween<double>(begin: widget.beginOpacity, end: widget.endOpacity)
      .animate(CurvedAnimation(parent: widget.controller, curve: curve));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation,
      child: FadeTransition(
        opacity: opacityAnimation,
        child: widget.child
      )
    );
  }
}