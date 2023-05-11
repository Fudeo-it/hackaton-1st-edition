import 'package:share_plus/share_plus.dart';

class ShareClass {
  static Future<void> share(String url) async {
    String newUrl = url.replaceAll('www.notion.so', 'offertelavoroflutter.it');
    Share.share(
        'controlla questo annuncio su offertelavoroflutter.it: \n\n$newUrl');
  }
}
