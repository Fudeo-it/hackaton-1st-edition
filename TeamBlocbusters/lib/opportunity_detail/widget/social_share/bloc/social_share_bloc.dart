import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_share_repository/social_share_repository.dart';

part 'social_share_event.dart';
part 'social_share_state.dart';

class SocialShareBloc extends Bloc<PressedSocialShareButton, SocialShareState> {
  SocialShareBloc({
    required SocialShareRepository socialShareRepository,
    required String jobOfferId,
    required String jobOfferTitle,
  })  : _socialShareRepository = socialShareRepository,
        _jobOfferId = jobOfferId,
        _jobOfferTitle = jobOfferTitle,
        super(const SocialShareState(shared: false)) {
    on<PressedSocialShareButton>(_handlePressedSocialShareButton);
  }

  final SocialShareRepository _socialShareRepository;
  final String _jobOfferId;
  final String _jobOfferTitle;

  void _handlePressedSocialShareButton(
    PressedSocialShareButton event,
    Emitter<SocialShareState> emit,
  ) {
    _socialShareRepository.socialShare(
      jobOfferId: _jobOfferId,
      jobOfferTitle: _jobOfferTitle,
    );
    emit(const SocialShareState(shared: true));
  }
}
