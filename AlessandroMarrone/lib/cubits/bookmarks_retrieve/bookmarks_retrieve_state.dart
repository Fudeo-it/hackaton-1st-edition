part of 'bookmarks_retrieve_cubit.dart';

abstract class BookmarkRetrieveState extends Equatable {
  const BookmarkRetrieveState();

  @override
  List<Object> get props => [];
}

class NoBookmarkRetrievedState extends BookmarkRetrieveState {}

class FetchingBookmarkState extends BookmarkRetrieveState {}

class FetchedBookmarkState extends BookmarkRetrieveState {
  final List<BookmarkModel> bookmarks;
  const FetchedBookmarkState({
    required this.bookmarks,
  });

  @override
  List<Object> get props => [bookmarks];
}
