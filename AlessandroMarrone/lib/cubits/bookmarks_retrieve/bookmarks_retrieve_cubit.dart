import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/models/bookmark_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';

part 'bookmarks_retrieve_state.dart';

class BookmarkRetrieveCubit extends Cubit<BookmarkRetrieveState> {
  final JobRepository jobRepository;
  BookmarkRetrieveCubit({required this.jobRepository})
      : super(NoBookmarkRetrievedState());

  Future<void> retrieveBookmarks() async {
    emit(FetchingBookmarkState());
    final bookmarks = await jobRepository.retrieveBookmark();

    emit(bookmarks != null && bookmarks.isNotEmpty
        ? FetchedBookmarkState(bookmarks: bookmarks)
        : NoBookmarkRetrievedState());
  }
}
