import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        // color: Colors.amber,
        children: [
          SpinKitSpinningLines(
            duration: const Duration(seconds: 3),
            size: 40,
            lineWidth: 3,
            color: Theme.of(context)
                .colorScheme
                .secondary
                .harmonizeWith(Theme.of(context).colorScheme.background),
          ),
          const Text(
            "There is more...",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          )
        ]
        // child: CircularProgressIndicator(strokeWidth: 1.5),
        );
  }
}
