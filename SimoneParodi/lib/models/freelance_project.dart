import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:offertelavoroflutter/models/formatted_text.dart';
import 'package:offertelavoroflutter/models/model.dart';

part 'freelance_project.g.dart';

enum Nda {
  si,
  no;

  @override
  toString() {
    switch (this) {
      case Nda.si:
        return 'Si';
      case Nda.no:
        return 'No';
    }
  }
}

enum TypeRelationship {
  commissions,
  freelance;

  @override
  toString() {
    switch (this) {
      case TypeRelationship.commissions:
        return 'Solo con chi commissiona il lavoro';
      case TypeRelationship.freelance:
        return 'Con altri professionisti';
    }
  }
}

@CopyWith()
class FreelanceProject extends Model {
  final String timing;
  final DateTime postedOn;
  final FormattedText howToApply;
  final List<FormattedText> jobRequest;
  final String budget;
  final Nda? nda;
  final String title;
  final String paymentTimes;
  final List<FormattedText> description;
  final TypeRelationship? typeRelationship;
  final bool favorite;
  final String url;

  const FreelanceProject({
    required super.id,
    required this.timing,
    required this.postedOn,
    required this.howToApply,
    required this.jobRequest,
    required this.budget,
    required this.nda,
    required this.title,
    required this.paymentTimes,
    required this.description,
    required this.typeRelationship,
    required this.url,
    this.favorite = false,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        timing,
        postedOn,
        howToApply,
        jobRequest,
        budget,
        nda,
        title,
        paymentTimes,
        description,
        typeRelationship,
        favorite,
        url,
      ];

  bool get isNda => nda == Nda.si;
}
