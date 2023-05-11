part of 'announcement_bloc.dart';

abstract class AnnouncementState extends Equatable {
  const AnnouncementState();

  @override
  List<Object> get props => [];
}

class FetchingAnnouncementState extends AnnouncementState {}

class FetchedAnnouncementState extends AnnouncementState {
  final List<Announcement> announcements;

  const FetchedAnnouncementState({
    required this.announcements,
  });

  @override
  List<Object> get props => [
        announcements,
      ];
}

class NoAnnouncementState extends AnnouncementState {}

class ErrorAnnouncementState extends AnnouncementState {
  final ErrorType type;

  const ErrorAnnouncementState({
    required this.type,
  });

  @override
  List<Object> get props => [
        type,
      ];
}
