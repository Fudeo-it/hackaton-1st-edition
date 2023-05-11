import 'package:flutter/material.dart';

class CircularLoadingWidget extends StatelessWidget {
  final Size? size;
  const CircularLoadingWidget({
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size?.height,
        width: size?.width,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
