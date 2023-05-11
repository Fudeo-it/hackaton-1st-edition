import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void showSnackbarInfo(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'INFO',
          message: message,
          inMaterialBanner: true,
          color: Colors.blueGrey
              .withOpacity(0.2)
              .harmonizeWith(Theme.of(context).colorScheme.background),

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      ),
    );
}
