import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/styles.dart';

class ContainerRow extends StatelessWidget {
  const ContainerRow({
    super.key,
    required this.route,
    required this.entity,
    required this.child,
  });

  final String route;
  final Object entity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        context.push(
          route,
          extra: entity,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BrandStyles.getBoxDecoration(colorScheme),
        child: child,
      ),
    );
  }
}
