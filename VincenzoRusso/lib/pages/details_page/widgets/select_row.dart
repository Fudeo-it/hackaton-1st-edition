import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/widgets/tag_color.dart';

class SelectRow extends StatelessWidget {
  final String label;
  final String selectLabel;
  final Color backgroundColor;
  final Color color;

  const SelectRow({
    super.key,
    required this.label,
    required this.selectLabel,
    required this.backgroundColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  TagColor(
                    text: selectLabel,
                    backgroundColor: backgroundColor,
                    color: color,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
