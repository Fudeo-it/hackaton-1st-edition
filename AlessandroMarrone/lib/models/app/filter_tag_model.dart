import 'package:offertelavoroflutter_it_app/utilities/extensions/app_localizations_no_context.dart';

class FilterTagModel {
  final String label;
  bool isSelected;

  FilterTagModel({
    required this.label,
    this.isSelected = false,
  });
}

final seniorityfilters = [
  FilterTagModel(label: AppLocalizationsNoContext.current.label_filter_junior),
  FilterTagModel(label: AppLocalizationsNoContext.current.label_filter_mid),
  FilterTagModel(label: AppLocalizationsNoContext.current.label_filter_senior),
];

final teamFilters = [
  FilterTagModel(label: AppLocalizationsNoContext.current.label_filter_onsite),
  FilterTagModel(label: AppLocalizationsNoContext.current.label_filter_hybrid),
  FilterTagModel(label: AppLocalizationsNoContext.current.label_filter_remote),
];

final agreementFilters = [
  FilterTagModel(
      label: AppLocalizationsNoContext.current.label_filter_fulltime),
  FilterTagModel(
      label: AppLocalizationsNoContext.current.label_filter_parttime),
];
