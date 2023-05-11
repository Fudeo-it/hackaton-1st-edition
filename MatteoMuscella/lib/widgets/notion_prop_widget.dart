import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NotionPropWidget extends StatelessWidget {
  final String propName;
  final String propValue;
  final String separator;

  const NotionPropWidget(this.propName, this.propValue,
      {this.separator = ': ', super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: '',
          style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
          children: <TextSpan>[
            TextSpan(
              text: propName,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            TextSpan(text: separator),
            _createValueSpan(),
          ],
        ),
      ),
    );
  }

  TextSpan _createValueSpan() {
    if (propValue.startsWith('http')) {
      return TextSpan(
        text: propValue,
        style: const TextStyle(color: Colors.blue, fontSize: 16),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            launchUrl(Uri.parse(propValue));
          },
      );
    }
    return TextSpan(text: propValue);
  }
}
