import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:just_audio/just_audio.dart';
import 'package:project/model/api/result/api_result.dart';
import 'package:project/model/song/song.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:project/service/api/api_service.dart';
import 'package:utopia_connectivity/utopia_connectivity.dart';
import 'package:project/service/audio/background_audio_handler.dart';
import 'package:project/service/audio/background_audio_service.dart';
import 'package:project/app/app_reporter.dart';

import '../../../util/audio_player/audio_player_utils.dart';
import '../../app_config.dart';

final _reporter = PrefixedReporter(appReporter, "[AudioState] ");

class AudioState extends HasInitialized {
  final BackgroundAudioHandler? backgroundAudioHandler;
  final MutableComputedState<SongModel?> currentSong;
  final ListenableMutableValue<bool> isPlaying;
  final Future<void> Function() play;
  final Future<void> Function() pause;

  AudioState({
    required this.backgroundAudioHandler,
    required this.currentSong,
    required this.isPlaying,
    required this.play,
    required this.pause,
    required super.isInitialized,
  });

  AudioPlayer? get audioPlayer => backgroundAudioHandler?.player;

  bool get isConnected => audioPlayer != null;

  Future<void> togglePlay() async {
    if (isPlaying.value) {
      await pause();
    } else {
      await play();
    }
  }
}

AudioState useAudioState() {
  final backgroundAudioService = useInjected<BackgroundAudioService>();
  final connectivityState = useProvided<ConnectivityState>();

  final handlerState = useAutoComputedState(
    shouldCompute: connectivityState.isInitialized,
    () async {
      if (connectivityState.hasConnection) {
        final url = AppConfig.audioStreamUrl;
        try {
          return await backgroundAudioService.init(url);
        } catch (e, s) {
          _reporter.error("Couldn't connect to $url", e: e, s: s);
          return null;
        }
      }
    },
    keys: [connectivityState.isInitialized],
  );

  final audioPlayer = useMemoized(() => handlerState.valueOrNull?.player, [
    handlerState.valueOrNull,
  ]);

  final refreshSignal = usePeriodicalSignal(period: Duration(seconds: 1));

  useAutoComputedState(
    shouldCompute: handlerState.isInitialized,
    () async {
      if (!connectivityState.hasConnection) return;
      if (handlerState.valueOrNull != null) return;
      await handlerState.refresh();
    },
    keys: [refreshSignal, connectivityState.result],
  );

  Future<void> dispose() async {
    _reporter.info("dispose()");
    await handlerState.valueOrNull?.dispose();
  }

  useEffect(() => dispose);

  final lifecycleState = useAppLifecycleState();

  useEffect(() async {
    _reporter.info("lifecycleState=$lifecycleState");
    if (Platform.isAndroid) {
      if (lifecycleState == AppLifecycleState.detached) {
        await dispose();
      }
    }
  }, [lifecycleState]);

  final radioApiService = useInjected<RadioApiService>();

  Future<void> updateNotification(SongModel? song) async {
    await handlerState.valueOrNull?.updateNotification(
      title: song?.title,
      coverImageUrl: AudioPlayerUtils.getRandomCoverImageUrl(),
    );
  }

  final signal = usePeriodicalSignal(period: const Duration(seconds: 10));
  final nowPlayingData = useAutoComputedState(() async {
    final result = await radioApiService.fetchNowPlaying();
    switch (result) {
      case final ApiResultData<SongModel> data:
        final song = data.value;
        unawaited(updateNotification(song));
        return song;
      case ApiResultError<SongModel> _:
        _reporter.warning("Problem z pobraniem piosenki");
        return null;
    }
  }, keys: [signal]);

  final isPlayingState = useState(false);

  useStreamSubscription(
    audioPlayer?.playingStream,
    (e) => isPlayingState.value = e,
  );

  Future<void> play() async {
    if (isPlayingState.value) return;
    try {
      await audioPlayer?.play();
      _reporter.info("Playing Radio WSZiB!");
    } catch (e, s) {
      _reporter.warning("Error in play", e: e, s: s);
    }
  }

  Future<void> pause() async {
    if (!isPlayingState.value) return;
    try {
      await audioPlayer?.stop();
      appReporter.info("Not playing Radio WSZiB!");
    } catch (e, s) {
      _reporter.warning("Error in pause", e: e, s: s);
    }
  }

  useAutoComputedState(
    shouldCompute: connectivityState.isInitialized,
    () async {
      if (!connectivityState.hasConnection) {
        await pause();
      }
    },
    keys: [connectivityState.result],
  );

  return AudioState(
    backgroundAudioHandler: handlerState.valueOrNull,
    currentSong: nowPlayingData,
    isPlaying: isPlayingState,
    play: play,
    pause: pause,
    isInitialized: handlerState.value is ComputedStateValueReady,
  );
}

void useAutoPauseAudio() {
  final audioState = useProvided<AudioState>();
  final initPlaying = useMemoized(() => audioState.isPlaying.value);

  void dispose() {
    if (initPlaying) {
      unawaited(audioState.play());
      _reporter.info("Audio auto resumed");
    }
  }

  void pause() {
    unawaited(audioState.pause());
    _reporter.info("Audio auto paused");
  }

  useEffect(() {
    pause();
    return dispose;
  });
}
