import 'package:flutter/material.dart';

class SlideTransictionWidget extends StatefulWidget {
  ///
  /// animazione usata per dare un effetto di  transizione  a un widget
  final Widget child;

  SlideTransictionWidget({required this.child});
  @override
  _SlideTransictionWidgetState createState() => _SlideTransictionWidgetState();
}

class _SlideTransictionWidgetState extends State<SlideTransictionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _positionAnimation =
        Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
            .animate(_controller);
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _positionAnimation,
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: 1,
          child: widget.child),
    );
  }
}
