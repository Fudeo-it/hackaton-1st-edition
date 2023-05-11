import 'package:flutter/material.dart';

class ProgressDots extends StatelessWidget {
  final int total;
  final int activeIndex;
  const ProgressDots({Key? key, required this.total, required this.activeIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for(int i = 0 ; i < total ; i++) {
      widgets.add(_buildDots(activeIndex == i, context));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }
  
  Widget _buildDots(bool active, BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;
    return AnimatedContainer(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? primary : primary.withAlpha(100)
      ),
    );
  }
}
