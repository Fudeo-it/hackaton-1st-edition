part of 'announcement_bloc.dart';

abstract class AnnouncementEvent extends Equatable {
  const AnnouncementEvent();

  @override
  List<Object> get props => [];
}

class FetchAnnouncementEvent extends AnnouncementEvent {
  final bool fetchFavorite;

  const FetchAnnouncementEvent({
    required this.fetchFavorite,
  });

  @override
  List<Object> get props => [
        fetchFavorite,
      ];
}

class AddFavoriteAnnouncementEvent extends AnnouncementEvent {
  final String id;

  const AddFavoriteAnnouncementEvent({
    required this.id,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
