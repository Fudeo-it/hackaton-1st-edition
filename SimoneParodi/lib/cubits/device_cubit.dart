import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';

enum DeviceType {
  phone,
  table,
}

class DeviceCubit extends Cubit<DeviceType> {
  DeviceCubit() : super(DeviceType.phone);

  void select({
    required double width,
  }) =>
      emit(width < DeviceSize.tablet ? DeviceType.phone : DeviceType.table);
}
