import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        foregroundColor: Styles.kPrimaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Styles.kBodyBold.copyWith(
          color: Styles.kPrimaryColor,
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.size = 24,
    this.color = Styles.kSecondaryColor,
    required this.onTap,
    this.hasBorder = false,
  });

  final IconData icon;
  final double size;
  final Color color;
  final VoidCallback onTap;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: InkWell(
        onTap: onTap,
        borderRadius: Styles.kBorderRadius,
        child: Ink(
          width: 56,
          height: kTextTabBarHeight,
          decoration: BoxDecoration(
            borderRadius: Styles.kBorderRadius,
            border: hasBorder
                ? Border.all(
                    color: Styles.kSecondaryColor,
                    width: 0,
                  )
                : null,
          ),
          child: Icon(
            icon,
            color: color,
            size: size,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.hasBorder = false,
    this.backgroundColor = Styles.kPrimaryColor,
    this.borderColor = Styles.kSecondaryColor,
    this.textColor = Styles.kWhite,
  });

  final String title;
  final VoidCallback onTap;

  final bool hasBorder;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: Styles.kBorderRadius,
      splashColor: textColor.withOpacity(0.2),
      highlightColor: textColor.withOpacity(0.2),
      child: Ink(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: Styles.kBorderRadius,
          border: hasBorder
              ? Border.all(
                  color: borderColor,
                  width: 0,
                )
              : null,
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            title,
            style: Styles.kButton.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
