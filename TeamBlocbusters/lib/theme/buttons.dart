import 'package:flutter/material.dart';
import 'package:fudeo_hackaton/theme/theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.action,
    required this.text,
    required this.iconData,
    super.key,
  });

  final VoidCallback action;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.sky,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onTap: action,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 48,
            vertical: 16,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: AppFonts.onboardingButton,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Icon(
                  iconData,
                  color: AppColors.white,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
