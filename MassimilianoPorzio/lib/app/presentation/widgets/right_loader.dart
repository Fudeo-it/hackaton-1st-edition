import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RightLoader extends StatelessWidget {
  const RightLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // color: Colors.amber,
          children: [
            SpinKitSpinningLines(
              duration: const Duration(seconds: 3),
              size: 50,
              lineWidth: 3,
              color: Theme.of(context)
                  .colorScheme
                  .secondary
                  .harmonizeWith(Theme.of(context).colorScheme.background),
            ),
            const Text(
              "...",
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            )
          ]
          // child: CircularProgressIndicator(strokeWidth: 1.5),
          ),
    );
  }
}
