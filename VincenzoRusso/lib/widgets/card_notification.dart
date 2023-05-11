import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class CardNotification extends StatelessWidget {
  final String title;
  final String? message;
  final bool error;
  final Widget? child;

  const CardNotification({
    required this.title,
    this.message,
    this.child,
    this.error = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: error
              ? AppColors.red.withAlpha(40)
              : AppColors.gray.withAlpha(40),
          border: Border.all(
            width: 1.5,
            color: error
                ? AppColors.red.withAlpha(100)
                : AppColors.gray.withAlpha(100),
          ),
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.gray,
              blurStyle: BlurStyle.outer,
              blurRadius: 3.0,
            )
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.gray,
                  ),
              textAlign: TextAlign.center,
            ),
            message == null
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      message!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.gray,
                          ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
            child == null
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: child,
                  ),
          ],
        ),
      );
}
