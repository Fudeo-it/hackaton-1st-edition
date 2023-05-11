// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/colors.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/utils.dart' as mutils;

class FilterBadge extends StatelessWidget {
  const FilterBadge({
    super.key,
    required this.color,
    required this.label,
  });

  final String color;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (label.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: mutils.getColorForSelect(
            color,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
