import 'package:flutter/material.dart';

class SlidingButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const SlidingButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
        foregroundColor: MaterialStateProperty.all(
          Colors.black,
        ),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 50),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColorDark,
            fontSize: 16,
            letterSpacing: 2),
      ),
    );
  }
}
