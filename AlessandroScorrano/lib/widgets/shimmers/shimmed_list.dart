import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmedList extends StatelessWidget {
  ///
  /// effetto che mostra la lista Shimmed in fase di caricamento.
  ///
  final Widget child;
  const ShimmedList({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).hintColor.withOpacity(0.8),
            highlightColor: Colors.grey.shade500,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.list, size: 30),
                  const Divider(),
                ],
              ),
            ),
          );
        } else if (index == 1) {
          return shimmedFilter(context);
        }
        return Shimmer.fromColors(
          baseColor: Theme.of(context).hintColor.withOpacity(0.2),
          highlightColor: Colors.grey.shade200,
          child: child,
        );
      },
    );
  }

  Widget shimmedContainer(BuildContext context, double width, double height) =>
      Shimmer.fromColors(
        baseColor: Theme.of(context).hintColor.withOpacity(0.8),
        highlightColor: Colors.grey.shade500,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );

  Widget shimmedFilter(BuildContext context) => Shimmer.fromColors(
        baseColor: Theme.of(context).hintColor.withOpacity(0.2),
        highlightColor: Colors.grey.shade400,
        child: Row(
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
              ),
            ),
          ),
        ),
      );
}
