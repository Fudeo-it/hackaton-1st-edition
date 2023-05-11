import 'package:flutter/material.dart';
import 'package:fudeo_hackaton/home/home.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProceedButton extends StatelessWidget {
  const ProceedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      action: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => const HomePage(),
        ),
      ),
      text: 'Prosegui',
      iconData: PhosphorIcons.bold.caretRight,
    );
  }
}
