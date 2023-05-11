import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/common/models/select_option/select_option.dart';

part 'hiring_job_offer_options.freezed.dart';

@freezed
class HiringJobOfferOptions with _$HiringJobOfferOptions {
  const factory HiringJobOfferOptions({
    required List<SelectOption>? team,
    required List<SelectOption>? contratto,
    required List<SelectOption>? seniority,
    required List<SelectOption>? ral,
  }) = _HiringJobOfferOptions;
}