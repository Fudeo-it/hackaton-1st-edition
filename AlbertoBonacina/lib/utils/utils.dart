import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

Color getColorForSelect(String color) {
  switch (color) {
    case 'blue':
      return const Color(0xFFBBDEFB);
    case 'red':
      return const Color(0xFFFFCDD2);
    case 'purple':
      return const Color(0xFFE1BEE7);
    case 'yellow':
      return const Color(0xFFFFF9C4);
    case 'green':
      return const Color(0xFFC8E6C9);
    case 'gray':
      return const Color(0xFFDDDDDD);
    case 'pink':
      return const Color(0xFFF5E0E9);
    case 'default':
    default:
      return const Color(0xFFF5F5F5);
  }
}

Color getLabelColorForSelect(String color) {
  switch (color) {
    case 'blue':
      return const Color(0xFF1A237E);
    case 'red':
      return const Color(0xFFB71C1C);
    case 'purple':
      return const Color(0xFF4A148C);
    case 'yellow':
      return const Color(0xFF424242);
    case 'green':
      return const Color(0xFF1B5E20);
    case 'gray':
      return const Color(0xFF212121);
    case 'pink':
      return const Color(0xFF4C2337);
    case 'default':
    default:
      return const Color(0xFF212121);
  }
}

//Open the browser with the url provided
void launchURL(String urlToLaunch) async {
  if (!await launchUrl(
    Uri.parse(urlToLaunch),
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $urlToLaunch');
  }
}

String formatDatetimeToDisplay(DateTime datetime, String format) {
  return DateFormat(format).format(datetime);
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void showToast(String message) {
  if (Platform.isAndroid || Platform.isIOS) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}

void copyToClipboard(String stringToCopy) {
  Clipboard.setData(ClipboardData(text: stringToCopy));
}

void showModalShareLinkQrCode(BuildContext context, String linkToShare) {
  showModalBottomSheet<void>(
    context: context,
    builder: (context) => Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QrImage(
            size: getScreenHeight(context) * .3,
            padding: const EdgeInsets.all(16),
            data: linkToShare,
            version: QrVersions.auto,
          ),
        ],
      ),
    ),
  );
}
