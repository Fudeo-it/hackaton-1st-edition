import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmedWidget extends StatelessWidget {
  final Widget child;

  const ShimmedWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: (context, index) => Shimmer.fromColors(
          child: child,
          baseColor: Colors.grey[300] ?? Colors.grey,
          highlightColor: Colors.grey[100] ?? Colors.grey,
        ),
        itemCount: 10,
      );
}
