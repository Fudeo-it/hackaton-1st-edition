import 'package:flutter/material.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/styles.dart';

class AboutRow extends StatelessWidget {
  const AboutRow(
      {super.key,
      required this.icon,
      required this.label,
      required this.callback});

  final String label;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BrandStyles.getBoxDecoration(colorScheme),
      child: ListTile(
        onTap: callback,
        leading: Icon(
          icon,
          size: 24,
          color: colorScheme.onSurfaceVariant,
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.navigate_next,
          size: 24,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
