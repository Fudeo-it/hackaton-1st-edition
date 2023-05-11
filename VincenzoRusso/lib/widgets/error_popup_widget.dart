import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class ErrorPopupWidget extends StatelessWidget {
  final VoidCallback? onConfirm;
  final String? title, subtitle, textConfirm;

  const ErrorPopupWidget({
    this.onConfirm,
    this.title,
    this.subtitle,
    this.textConfirm,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      backgroundColor: AppColors.lightRed.withAlpha(240),
      content: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 24.0,
          bottom: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title == null
                ? const SizedBox()
                : Text(
                    title!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
            SizedBox(height: subtitle == null ? 0.0 : 8.0),
            subtitle == null
                ? const SizedBox()
                : Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
            const SizedBox(height: 16.0),
            CupertinoButton(
              child: Text(
                "Esci",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              onPressed: () => context.router.pop(),
            ),
            // JobFlutterButton(
            //   child: child,
            // ),
            // VisitCustomButton(
            //   padding: const EdgeInsets.all(12.0),
            //   color: PaginemedicheTheme.red,
            //   child: Text(
            //     textConfirm ?? Language.getValue(context, "visitami_exit"),
            //     style: PaginemedicheTheme.buttonWhiteText,
            //   ),
            //   onPressed: onConfirm == null
            //       ? null
            //       : () {
            //           NavigatorBase.instance.pop(context);
            //           onConfirm!();
            //         },
            // ),
            // const SizedBox(height: 16.0),
            // VisitCustomButton(
            //   padding: const EdgeInsets.all(12.0),
            //   outlined: true,
            //   child: Text(
            //     Language.getValue(context, "visitami_cancel"),
            //     style: PaginemedicheTheme.cancelDeleteText,
            //   ),
            //   onPressed: () => NavigatorBase.instance.pop(context),
            // ),
          ],
        ),
      ),
    );
  }
}
