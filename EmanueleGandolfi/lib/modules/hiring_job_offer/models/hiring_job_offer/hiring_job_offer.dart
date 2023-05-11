import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/common/models/select_option/select_option.dart';
import 'package:offertelavoroflutter_app/modules/common/models/styled_text/styled_text.dart';

part 'hiring_job_offer.freezed.dart';

@freezed
class HiringJobOffer with _$HiringJobOffer {

  const factory HiringJobOffer({
    required String id,
    required bool archived,
    required String? emoji,
    required String url,
    required DateTime? jobPosted,
    required SelectOption? team,
    required SelectOption? contratto,
    required SelectOption? seniority,
    required SelectOption? ral,
    required List<StyledText>? name,
    required List<StyledText>? qualifica,
    required List<StyledText>? retribuzione,
    required List<StyledText>? descrizioneOfferta,
    required List<StyledText>? comeCandidarsi,
    required List<StyledText>? localita,
    required List<StyledText>? nomeAzienda,
    required List<StyledText>? statoDiPubblicazione,
    required String? urlSitoWeb,
  }) = _HiringJobOffer;
}