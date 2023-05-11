import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/styles.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: Styles.kBorderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Styles.kWhite,
            size: 24,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              title,
              style: Styles.kBody.copyWith(
                color: Styles.kWhite,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
