import 'package:url_launcher/url_launcher_string.dart';

class AppUrlLauncher {

  static openUrlInBrowser(String url) async {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  }
}