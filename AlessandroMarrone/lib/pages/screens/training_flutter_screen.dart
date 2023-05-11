import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/web_view_wrapper_widget.dart';

class TrainingFlutterScreen extends StatelessWidget {
  const TrainingFlutterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Academy"),
      ),
      body: const WebViewWrapperWidget(url: K.trainingFudeoBaseUrl),
    );
  }
}
