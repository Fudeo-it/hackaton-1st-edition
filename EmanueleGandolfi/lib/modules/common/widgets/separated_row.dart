import 'package:flutter/material.dart';

class SeparatedRow extends StatelessWidget {
  final List<Widget> children;
  final Widget Function(BuildContext context) separatorBuilder;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const SeparatedRow({Key? key, required this.children, required this.separatorBuilder,
    this.mainAxisAlignment = MainAxisAlignment.start, this.crossAxisAlignment = CrossAxisAlignment.center }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> separatedChildren = children.toList();
    if(separatedChildren.length > 1) {
      for (int i = children.length - 1; i > 0; i--) {
        separatedChildren.insert(i, separatorBuilder(context));
      }
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: separatedChildren,
    );
  }
}
