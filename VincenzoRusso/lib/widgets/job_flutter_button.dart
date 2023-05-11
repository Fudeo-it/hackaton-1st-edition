import 'package:flutter/cupertino.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class JobFlutterButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final EdgeInsets? padding;
  final bool outlined;

  const JobFlutterButton({
    super.key,
    required this.child,
    this.padding,
    this.onPressed,
    this.color,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) => !outlined
      ? CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              border: Border.all(
                color: AppColors.primaryLight,
              ),
              borderRadius: BorderRadius.circular(42),
            ),
            child: Center(child: child),
          ),
        )
      : CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Container(
            padding: (padding != null)
                ? padding
                : const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
            decoration: BoxDecoration(
              color: AppColors.transparent,
              border: Border.all(
                color: color ?? AppColors.primaryLight,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(42),
            ),
            child: Center(child: child),
          ),
        );
}
