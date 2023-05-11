import 'package:flutter/material.dart';

class TagColor extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color color;

  const TagColor({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints(
          maxWidth: 90,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 1.5,
          horizontal: 8.0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      );
}
