import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:job_app/app/resources/color_manager.dart';

void showOnlineSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Online!',
          message: 'Sei di nuovo online!',
          inMaterialBanner: true,
          color: Colors.green.shade500
              .harmonizeWith(Theme.of(context).colorScheme.background),

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      ),
    );
}

void showOfflineSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: AwesomeSnackbarContent(
          title: 'Offline!',
          message: 'Sei offine! Controlla la connessione a Internet',
          inMaterialBanner: true,
          color: ColorManager.darkRed
              .harmonizeWith(Theme.of(context).colorScheme.background),

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
      ),
    );
}
