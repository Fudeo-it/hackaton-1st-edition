import 'package:url_launcher/url_launcher.dart';

class LaunchUrlService {
  static launchWebUrl(
    String url,
  ) {
    launchUrl(Uri.parse(url));
  }

  static launchMail(
    String email, {
    String? subject,
  }) {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Candidatura per $subject',
    );
    launchUrl(uri);
  }
}
