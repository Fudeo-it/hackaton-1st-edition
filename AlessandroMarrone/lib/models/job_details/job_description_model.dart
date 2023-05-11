import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_text_model.dart';

class JobDescriptionModel extends Equatable {
  final List<JobTextModel> descriptionItems;

  const JobDescriptionModel({
    required this.descriptionItems,
  });

  @override
  List<Object?> get props => [descriptionItems];
}
