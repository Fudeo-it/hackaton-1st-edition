import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherRepository {
  const UrlLauncherRepository();

  Future<void> launchMyUrl(String urlString) async {
    final bool isEmail = RegExp(K.regexEmail).hasMatch(urlString);
    final bool isUrl = RegExp(K.regexUrl).hasMatch(urlString);
    Uri uri;

    if (isEmail) {
      uri = Uri(
        scheme: "mailto",
        path: urlString,
      );
    } else if (isUrl) {
      uri = Uri.parse(urlString);
    } else {
      throw ErrorLauncher("Non è presente nè un link, nè una mail");
    }

    final checkLaunch = await canLaunchUrl(uri);

    if (!checkLaunch) {
      throw ErrorLauncher("Non è possibile aprire il link");
    } else {
      launchUrl(uri);
    }
  }
}

class ErrorLauncher extends Error {
  final String? text;

  ErrorLauncher([this.text = '']);
}
