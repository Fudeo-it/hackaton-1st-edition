import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/styles.dart';

abstract class CustomSnackbars {
  static Future<void> showInfo(
    BuildContext context, {
    required String message,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Styles.kBody.copyWith(
            color: Styles.kWhite,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: Styles.kRoundedRectangleBorder,
        backgroundColor: Styles.kPrimaryColor,
      ),
    );
  }
}
