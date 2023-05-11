import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_it_app/models/share_job_model.dart';

import 'package:offertelavoroflutter_it_app/repositories/share_job_repository.dart';
import 'package:offertelavoroflutter_it_app/utilities/enums.dart';

class ShareJobCubit extends Cubit<void> {
  final ShareJobRepository shareJobRepository;

  ShareJobCubit({
    required this.shareJobRepository,
  }) : super(null);

  void shareJob(ShareType share, {required ShareJobModel data}) async =>
      await shareJobRepository.shareJobServ(share, data);
}
