import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';

String stringFromFilter(Filter f) {
  switch (f) {
    case Filter.fullRemote:
      return 'Full Remote';
    case Filter.hybrid:
      return 'Ibrido';
    case Filter.onSite:
      return 'In Sede';
    case Filter.partTime:
      return 'Part Time';
    case Filter.fullTime:
      return 'Full Time';
    case Filter.junior:
      return 'Junior';
    case Filter.mid:
      return 'Mid';
    case Filter.senior:
      return 'Senior';
  }
}
