import 'package:hydrated_bloc/hydrated_bloc.dart';

class DarkModeCubit extends HydratedCubit<bool> {
  DarkModeCubit() : super(false);

  @override
  bool? fromJson(Map<String, dynamic> json) => json['enabled'] as bool;

  @override
  Map<String, dynamic>? toJson(bool state) => {'enabled': state};

  void toggle() => emit(!state);
}
