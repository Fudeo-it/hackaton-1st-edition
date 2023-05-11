import 'package:flutter/material.dart';

class ConditionalFlexFit extends StatelessWidget {
  const ConditionalFlexFit({
    super.key,
    required this.child,
    this.wrapWithFlexFit = true,
  });

  final Widget child;
  final bool wrapWithFlexFit;

  @override
  Widget build(BuildContext context) {
    if (!wrapWithFlexFit) return child;

    return Flexible(
      child: FittedBox(
        child: child,
      ),
    );
  }
}
