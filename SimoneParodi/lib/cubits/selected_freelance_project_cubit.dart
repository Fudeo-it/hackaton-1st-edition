import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/models/freelance_project.dart';

class SelectedFreelanceProjectCubit extends Cubit<FreelanceProject?> {
  SelectedFreelanceProjectCubit() : super(null);

  void select(FreelanceProject freelanceProject) => emit(freelanceProject);
}
