import 'package:hydrated_bloc/hydrated_bloc.dart';

class FirstStartCubit extends Cubit<bool> with HydratedMixin {
  ///
  /// [HydratedCubit] utilizzato per segnalare il primo avvio dell'app
  /// per mostrare il carosello di benvenuto e il tutorial.
  ///
  FirstStartCubit() : super(true) {
    hydrate();
  }

  @override
  bool fromJson(Map<String, dynamic> json) => json['value'] as bool;

  @override
  Map<String, bool> toJson(bool state) => {'value': state};

  void notifyFirstStart() => emit(false);

  void prova() => emit(true);
}
