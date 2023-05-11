import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/models/announcement.dart';

class SelectedAnnouncementCubit extends Cubit<Announcement?> {
  SelectedAnnouncementCubit() : super(null);

  void select(Announcement announcement) => emit(announcement);
}
