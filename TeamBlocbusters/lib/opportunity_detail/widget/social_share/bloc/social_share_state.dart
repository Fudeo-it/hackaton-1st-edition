part of 'social_share_bloc.dart';

class SocialShareState extends Equatable {
  const SocialShareState({required this.shared});

  final bool shared;

  @override
  List<Object?> get props => [shared];
}
