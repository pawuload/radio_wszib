import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:utopia_arch/utopia_arch.dart';

import '../../app/app_reporter.dart';

class BackgroundAudioHandler extends BaseAudioHandler {
  final _reporter = PrefixedReporter(appReporter, "[BackgroundAudioHandler] ");
  final _player = AudioPlayer();

  AudioPlayer get player => _player;

  Future<void> init(String url) async {
    await _player.setAudioSource(AudioSource.uri(Uri.parse(url)));
    _notifyAudioHandlerAboutPlaybackEvents();
    _reporter.info("Initialized");
  }
  void _notifyAudioHandlerAboutPlaybackEvents() {
    _player.playbackEventStream.listen(
      (event) {
        final playing = _player.playing;
        final currentState = playbackState.value;

        final nextState = currentState.copyWith(
          playing: playing,
          processingState: switch (event.processingState) {
            ProcessingState.idle => AudioProcessingState.idle,
            ProcessingState.loading => AudioProcessingState.loading,
            ProcessingState.buffering => AudioProcessingState.buffering,
            ProcessingState.ready => AudioProcessingState.ready,
            ProcessingState.completed => AudioProcessingState.completed,
          },
          controls: [
            if (!playing) MediaControl.play,
            if (playing) MediaControl.pause,
          ],
          androidCompactActionIndices: const [0],
        );

        playbackState.add(nextState);
      },
    );
  }

  @override
  Future<void> play() async {
    _reporter.info("play()");
    await _player.play();
  }

  @override
  Future<void> pause() async {
    _reporter.info("pause()");
    await _player.pause();
  }

  @override
  Future<void> stop() async {
    _reporter.info("stop()");
    await _player.stop();
    return super.stop();
  }

  Future<void> dispose() async {
    _reporter.info("dispose()");
    await _player.stop();
    await _player.dispose();
    await super.stop();
  }

  Future<void> updateNotification({String? title, required String coverImageUrl}) async {
    final item = MediaItem(
      id: "default",
      title: title ?? "Human music",
      artist: "Radio WSZiB 24/7",
      isLive: true,
      artUri: Uri.parse(coverImageUrl),
    );

    mediaItem.add(item);

    _reporter.info("Update notification title=$title, coverImageUrl=$coverImageUrl");
  }
}
