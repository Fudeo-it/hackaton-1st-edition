import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:job_app/core/log/bloc_logger.dart';

import '../../../../core/services/service_locator.dart';

part 'sound_state.dart';

class SoundCubit extends HydratedCubit<SoundState> with BlocLoggy {
  SoundCubit() : super(const SoundInitial());

  @override
  SoundState? fromJson(Map<String, dynamic> json) {
    return SoundState(muted: json["value"] as bool);
  }

  @override
  Map<String, dynamic>? toJson(SoundState state) {
    return {"value": state.muted};
  }

  void toggleMute() {
    loggy.debug(state.muted ? "UNMUTING..." : "MUTING...");
    var player = sl<AudioPlayer>();
    emit(SoundState(muted: !state.muted));
    player.setVolume(state.muted ? 0 : 1);
  }
}
