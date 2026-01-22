import 'package:project/app/state/audio/audio_state.dart';
import 'package:project/model/song/song.dart';
import 'package:utopia_arch/utopia_arch.dart';

class RadioScreenState {
  final void Function() onPlayPressed;
  final bool hasAudioStarted, isRadioInitialized;
  final SongModel? currentSong;

  const RadioScreenState({
    required this.onPlayPressed,
    required this.hasAudioStarted,
    required this.isRadioInitialized,
    required this.currentSong,
  });
}

RadioScreenState useRadioScreenState() {
  final audioState = useProvided<AudioState>();

  final currentSong = usePreviousIfNull(audioState.currentSong.valueOrNull);

  return RadioScreenState(
    onPlayPressed: audioState.togglePlay,
    hasAudioStarted: audioState.isPlaying.value,
    currentSong: currentSong,
    isRadioInitialized: audioState.isConnected,
  );
}
