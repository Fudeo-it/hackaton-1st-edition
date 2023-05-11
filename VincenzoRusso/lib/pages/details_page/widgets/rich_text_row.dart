import 'package:flutter/material.dart';

class RichTextRow extends StatelessWidget {
  final String label;
  final List<String> texts;

  const RichTextRow({
    super.key,
    required this.label,
    required this.texts,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 5,
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: texts
                          .map(
                            (text) => TextSpan(text: text),
                          )
                          .toList(growable: false),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
