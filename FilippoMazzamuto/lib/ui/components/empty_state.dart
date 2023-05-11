import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String? message;

  const EmptyState({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/no_data.jpg",
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.height,
        ),
        Text(
          message ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500
          ),
        ),
      ]
    );
  }
}