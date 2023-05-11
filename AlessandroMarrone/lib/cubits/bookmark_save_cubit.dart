import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:offertelavoroflutter_it_app/models/bookmark_model.dart';

import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';

class BookmarkSaveCubit extends Cubit<bool> {
  final JobRepository jobRepository;

  BookmarkSaveCubit({
    required this.jobRepository,
  }) : super(false);

  void saveBookmark(String jobId) async {
    final job = BookmarkModel(id: jobId);
    await jobRepository.createBookmark(job);
    emit(true);
  }

  void checkBookmark(String jobId) async {
    final job = BookmarkModel(id: jobId);

    emit(await jobRepository.checkBookmark(job));
  }

  void deleteBookmark(String jobId) async {
    final job = BookmarkModel(id: jobId);
    await jobRepository.deleteBookmarK(job);
    emit(false);
  }
}
