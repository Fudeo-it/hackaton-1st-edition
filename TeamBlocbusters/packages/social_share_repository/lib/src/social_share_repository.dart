import 'package:share_plus/share_plus.dart';

class SocialShareRepository {
  void socialShare({
    required String jobOfferId,
    required String jobOfferTitle,
  }) {
    Share.share(
      "Dai un'occhiata a quest'opportunità: \n$jobOfferTitle \nhttps://offertelavoroflutter.it/${jobOfferId.replaceAll(RegExp('[^A-Za-z0-9]'), '')}",
    );
  }
}
