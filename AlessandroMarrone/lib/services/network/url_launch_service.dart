import 'package:offertelavoroflutter_it_app/errors/network_error.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauunchService {
  Future<void> openUrlInApp(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    )) {
      throw NetworkError(400, "'Could not launch $url'");
    }
  }

  void openMailClient(String email, String subject) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters(<String, String>{
        'subject': subject,
      }),
    );

    launchUrl(emailLaunchUri);
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> param) =>
            '${Uri.encodeComponent(param.key)}=${Uri.encodeComponent(param.value)}')
        .join('&');
  }
}
