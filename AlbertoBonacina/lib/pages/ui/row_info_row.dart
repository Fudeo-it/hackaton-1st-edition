import 'package:flutter/material.dart';

class RowInfoRow extends StatelessWidget {
  const RowInfoRow(
      {super.key,
      required this.label,
      this.icon,
      this.size = 15,
      this.isWithIcon = false});

  final IconData? icon;
  final String label;
  final double size;
  final bool isWithIcon;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    if (label.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isWithIcon)
            Padding(
              padding: const EdgeInsets.only(top: 2, right: 8),
              child: Icon(
                icon,
                size: size,
              ),
            ),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: size,
                color: colorScheme.onBackground,
              ),
              textAlign: TextAlign.start,
            ),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
