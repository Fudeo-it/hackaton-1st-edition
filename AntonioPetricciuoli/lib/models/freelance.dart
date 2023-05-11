import 'package:equatable/equatable.dart';

class Freelance extends Equatable {
  final String? id;
  final String? icon;
  final String? code;
  final String? projectDescription;
  final String? jobRequested;
  final String? relationType;
  final String? timing;
  final String? budget;
  final String? paymentTimes;
  final String? nda;
  final String? howToApply;
  final String? jobPosted;
  final bool? isSaved;
  final String? date;

  const Freelance({
    this.id,
    this.icon,
    this.code,
    this.projectDescription,
    this.jobRequested,
    this.relationType,
    this.timing,
    this.budget,
    this.paymentTimes,
    this.nda,
    this.howToApply,
    this.jobPosted,
    this.isSaved,
    this.date,
  });

  Freelance copyWith({
    String? id,
    String? icon,
    String? code,
    String? projectDescription,
    String? jobRequested,
    String? relationType,
    String? timing,
    String? budget,
    String? paymentTimes,
    String? nda,
    String? howToApply,
    String? jobPosted,
    bool? isSaved,
    String? date,
  }) {
    return Freelance(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      code: code ?? this.code,
      projectDescription: projectDescription ?? this.projectDescription,
      jobRequested: jobRequested ?? this.jobRequested,
      relationType: relationType ?? this.relationType,
      timing: timing ?? this.timing,
      budget: budget ?? this.budget,
      paymentTimes: paymentTimes ?? this.paymentTimes,
      nda: nda ?? this.nda,
      howToApply: howToApply ?? this.howToApply,
      jobPosted: jobPosted ?? this.jobPosted,
      isSaved: isSaved ?? this.isSaved,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        id,
        icon,
        code,
        projectDescription,
        jobRequested,
        relationType,
        timing,
        budget,
        paymentTimes,
        nda,
        howToApply,
        jobPosted,
        isSaved,
        date,
      ];
}
