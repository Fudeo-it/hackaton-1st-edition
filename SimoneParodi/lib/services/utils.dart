import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter/extension/string_extension.dart';
import 'package:offertelavoroflutter/models/formatted_text.dart';
import 'package:offertelavoroflutter/services/launch_url_service.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';
import 'package:offertelavoroflutter/themes/my_theme.dart';

enum ErrorType {
  local,
  newtwork,
  repository,
  noConnectivity,
}

class Utils {
  static void jobApplyNow(
    context, {
    required FormattedText formattedText,
    required String? emailSubject,
  }) {
    final bool applyWithEmail = formattedText.url == null;
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Container(
          padding: const EdgeInsets.all(MyInsets.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Candidati',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: MyInsets.m),
                child: Text(
                  'Istruzioni per candidarsi:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: applyWithEmail
                      ? formattedText.text
                      : 'Recarsi sul sito: ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: applyWithEmail
                      ? null
                      : [
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () => LaunchUrlService.launchWebUrl(
                                formattedText.url!,
                              ),
                              child: Text(
                                formattedText.url!,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ),
                        ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: MyInsets.m),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (applyWithEmail) {
                          try {
                            final email = formattedText.text
                                .split(' ')
                                .firstWhere((element) => element.isEmail)
                                .trim();
                            LaunchUrlService.launchMail(
                              email,
                              subject: emailSubject,
                            );
                          } on StateError {
                            messenger(
                              context,
                              icon: FontAwesomeIcons.circleExclamation,
                              message: 'Nessuna mail rilevata',
                            );
                          }
                        } else {
                          LaunchUrlService.launchWebUrl(formattedText.url!);
                        }
                      },
                      child: Text(
                        applyWithEmail ? 'Invia email' : 'Vai al sito',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static messenger(
    BuildContext context, {
    Color? backgroundColor,
    Color? foregroundColor,
    required IconData icon,
    required String message,
  }) {
    late Timer timer;
    showGeneralDialog(
      barrierLabel: '',
      barrierColor: Colors.transparent,
      context: context,
      transitionDuration: const Duration(milliseconds: 700),
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        timer = Timer(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });
        return SafeArea(
          child: Dialog(
            backgroundColor: backgroundColor,
            alignment: Alignment.topLeft,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(MyInsets.m),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: foregroundColor ??
                        Theme.of(context).colorScheme.secondary,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: MyInsets.s),
                      child: Text(
                        message,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: foregroundColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(
            0.0,
            curvedValue * 200,
            0.0,
          ),
          child: widget,
        );
      },
    ).then(
      (value) => timer.cancel(),
    );
  }

  static Widget shimmerContainer(Size a) {
    return Container(
      decoration: BoxDecoration(
        color: MyTheme.placeholderColorForShimmer,
        borderRadius: BorderRadius.circular(MyRadius.m),
      ),
      width: a.width,
      height: a.height,
    );
  }
}
