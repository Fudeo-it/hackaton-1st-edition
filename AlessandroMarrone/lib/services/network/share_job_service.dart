import 'package:flutter_share_me/flutter_share_me.dart';

class ShareJobService {
  final FlutterShareMe _flutterShareMe = FlutterShareMe();

  Future<void> shareToFacebook(String url, String msg) async =>
      _flutterShareMe.shareToFacebook(msg: msg, url: url);

  Future<void> shareToWhatsApp(String url, String msg) async =>
      _flutterShareMe.shareToWhatsApp(msg: msg, imagePath: url);

  Future<void> shareToTwitter(String url, String msg) async =>
      _flutterShareMe.shareToTwitter(msg: msg, url: url);

  Future<void> shareToSystem(String url, String msg) async =>
      _flutterShareMe.shareToSystem(msg: "$msg \n $url");
}
