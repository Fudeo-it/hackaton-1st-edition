import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class TrasformToUrl {
  static var logger = Logger();

  static Uri transformToUrl(String text) {
    logger.i("method _transformToUrl >> input string: " + text);
    var splitted = text.split(" ");
    var iterator = splitted.iterator;
    var finalUrl;
    Uri _url = Uri();
    while (iterator.moveNext()) {
      var potentialLink = iterator.current;
      if (potentialLink.contains('@')) {
        _url = Uri(
          scheme: 'mailto',
          path: potentialLink,
          query: 'subject=Invio CV per candidatura',
        );
        finalUrl = potentialLink;
      } else if (potentialLink.contains('http')) {
        finalUrl = potentialLink;
        _url = Uri.parse(potentialLink);
      }
    }
    if (_url.toString().isEmpty) {
      throw Exception(
          'method _transformToUrl >> this string is not a valid email or link');
    }
    logger.i("method _transformToUrl >> output string: " + _url.toString());
    return _url;
  }
}
