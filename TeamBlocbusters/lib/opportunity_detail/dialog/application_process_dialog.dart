import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ApplicationProcessDialog extends StatelessWidget {
  const ApplicationProcessDialog({
    required this.applicationProcess,
    super.key,
  });

  final String applicationProcess;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: AppColors.accentLight,
          border: Border.all(color: AppColors.lightGrey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text(
                  'Candidati!',
                  style: AppFonts.applicationProcessDialogTitle,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(
                    PhosphorIcons.bold.confetti,
                    color: AppColors.black,
                    size: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Html(
              data: applicationProcess,
              style: {
                'body': Style.fromTextStyle(
                  AppFonts.applicationProcessDialogSubtitle,
                )
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> show(BuildContext context, String applicationProcess) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => ApplicationProcessDialog(
        applicationProcess: applicationProcess,
      ),
    );
  }
}
