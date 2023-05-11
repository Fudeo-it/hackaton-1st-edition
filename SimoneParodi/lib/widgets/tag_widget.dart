import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';

class TagWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;
  const TagWidget({
    required this.color,
    this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: MyInsets.xs),
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        color: color.withAlpha(40),
        borderRadius: BorderRadius.circular(MyRadius.s),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 18,
              color: color,
            ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                left: icon == null ? MyInsets.zero : MyInsets.xs,
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
