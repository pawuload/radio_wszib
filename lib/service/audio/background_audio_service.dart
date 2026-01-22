import 'package:audio_service/audio_service.dart';
import 'package:project/service/audio/background_audio_handler.dart';

class BackgroundAudioService {
  Future<BackgroundAudioHandler> init(String url) async {
    final handler = await AudioService.init(
      builder: BackgroundAudioHandler.new,
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'io.utopiasoft.project.audio',
        androidNotificationChannelName: 'project',
        androidNotificationOngoing: true,
        androidStopForegroundOnPause: true,
      ),
    );
    await handler.init(url);
    return handler;
  }
}
