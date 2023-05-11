import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/common/models/select_option/select_option.dart';

part 'freelance_job_offer_options.freezed.dart';

@freezed
class FreelanceJobOfferOptions with _$FreelanceJobOfferOptions {
  const factory FreelanceJobOfferOptions({
    required List<SelectOption>? nda,
    required List<SelectOption>? tipoDiRelazione,
  }) = _FreelanceJobOfferOptions;
}