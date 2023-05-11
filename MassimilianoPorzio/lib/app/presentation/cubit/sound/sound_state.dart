part of 'sound_cubit.dart';

class SoundState extends Equatable {
  final bool muted;
  const SoundState({required this.muted});

  @override
  List<Object> get props => [muted];
}

class SoundInitial extends SoundState {
  const SoundInitial({super.muted = false});
}
