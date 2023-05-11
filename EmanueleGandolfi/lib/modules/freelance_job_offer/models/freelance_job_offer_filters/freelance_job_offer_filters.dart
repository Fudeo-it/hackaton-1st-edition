import 'package:freezed_annotation/freezed_annotation.dart';

part 'freelance_job_offer_filters.freezed.dart';

@freezed
class FreelanceJobOfferFilters with _$FreelanceJobOfferFilters {
  const FreelanceJobOfferFilters._();

  const factory FreelanceJobOfferFilters({
    @Default([])
    List<String> nda,
    @Default([])
    List<String> tipoDiRelazione,
  }) = _FreelanceJobOfferFilters;

  bool get active => nda.isNotEmpty || tipoDiRelazione.isNotEmpty;
}