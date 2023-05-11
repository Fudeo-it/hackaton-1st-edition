// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:offertelavoroflutter_it_app/models/share_job_model.dart';
import 'package:offertelavoroflutter_it_app/services/network/share_job_service.dart';
import 'package:offertelavoroflutter_it_app/utilities/enums.dart';

class ShareJobRepository {
  final ShareJobService shareJovService;

  ShareJobRepository({
    required this.shareJovService,
  });

  Future<void> shareJobServ(ShareType share, ShareJobModel data) async {
    switch (share) {
      case ShareType.facebook:
        await shareJovService.shareToFacebook(data.url ?? "", data.msg);
        break;

      case ShareType.whatsapp:
        await shareJovService.shareToWhatsApp(data.url ?? "", data.msg);
        break;

      case ShareType.twitter:
        await shareJovService.shareToTwitter(data.url ?? "", data.msg);
        break;

      case ShareType.share_system:
        await shareJovService.shareToSystem(data.url ?? "", data.msg);
        break;

      default:
        break;
    }
  }
}
