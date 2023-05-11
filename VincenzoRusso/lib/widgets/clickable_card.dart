import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class ClickableCard extends StatelessWidget {
  final String text;
  final GestureTapCallback? onPressed;

  const ClickableCard({
    required this.text,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withAlpha(150),
              border: Border.all(
                color: AppColors.primaryLight,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.primaryDark,
                  blurRadius: 3.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
}
