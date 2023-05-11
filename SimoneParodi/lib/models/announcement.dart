import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:offertelavoroflutter/models/formatted_text.dart';
import 'package:offertelavoroflutter/models/model.dart';
import 'package:offertelavoroflutter/extension/string_extension.dart';

part 'announcement.g.dart';

enum Seniority {
  junior,
  mid,
  senior;

  @override
  toString() {
    switch (this) {
      case Seniority.junior:
        return 'Junior';
      case Seniority.mid:
        return 'Mid';
      case Seniority.senior:
        return 'Senior';
    }
  }
}

enum Team {
  remote,
  hybrid,
  office;

  @override
  toString() {
    switch (this) {
      case Team.remote:
        return 'Da remoto';
      case Team.hybrid:
        return 'Ibrido';
      case Team.office:
        return 'In sede';
    }
  }
}

enum Contract {
  fullTime,
  partTime;

  @override
  toString() {
    switch (this) {
      case Contract.fullTime:
        return 'Full time';
      case Contract.partTime:
        return 'Part time';
    }
  }
}

@CopyWith()
class Announcement extends Model {
  final String name;
  final String companyName;
  final String? webSiteUrl;
  final String? qualification;
  final Seniority? seniority;
  final Team? team;
  final Contract? contract;
  final String? salary;
  final String? ral;
  final List<FormattedText> desription;
  final FormattedText howToApply; //link a sito o mail
  final DateTime postedOn;
  final String? location;
  final bool favorite;
  final String url;

  const Announcement({
    required super.id,
    required this.name,
    required this.companyName,
    required this.webSiteUrl,
    required this.qualification,
    required this.seniority,
    required this.team,
    required this.contract,
    required this.salary,
    required this.ral,
    required this.desription,
    required this.howToApply,
    required this.postedOn,
    required this.location,
    required this.url,
    this.favorite = false,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        companyName,
        webSiteUrl,
        qualification,
        seniority,
        team,
        contract,
        salary,
        ral,
        desription,
        howToApply,
        postedOn,
        location,
        favorite,
        url,
      ];

  String get title => !qualification.isNullOrEmpty ? qualification! : name;
}
