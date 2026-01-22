import 'dart:math';

import 'package:project/app/app_config.dart';

class AudioPlayerUtils {
  AudioPlayerUtils._();
  static String getRandomCoverImageUrl() {
    final images = AppConfig.audioPlayerCoverImages;
    final image = images[Random().nextInt(images.length - 1)];
    return AppConfig.getStorageObjectUrl("covers/$image");
  }
}
