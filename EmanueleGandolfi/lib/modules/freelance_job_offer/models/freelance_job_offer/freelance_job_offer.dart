import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/common/models/select_option/select_option.dart';
import 'package:offertelavoroflutter_app/modules/common/models/styled_text/styled_text.dart';

part 'freelance_job_offer.freezed.dart';

@freezed
class FreelanceJobOffer with _$FreelanceJobOffer {
  const factory FreelanceJobOffer({
    required String id,
    required bool archived,
    required String? emoji,
    required String url,
    required DateTime? jobPosted,
    required List<StyledText>? tempistiche,
    required List<StyledText>? comeCandidarsi,
    required List<StyledText>? richiestaDiLavoro,
    required List<StyledText>? budget,
    required SelectOption? nda,
    required List<StyledText>? codice,
    required List<StyledText>? tempisticheDiPagamento,
    required List<StyledText>? descrizioneDelProgetto,
    required SelectOption? tipoDiRelazione
  }) = _FreelanceJobOffer;
}