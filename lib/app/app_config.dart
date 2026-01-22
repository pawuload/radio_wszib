import 'package:path/path.dart' as p;

class AppConfig {
  const AppConfig._();

  static const dev = AppConfig._();

  static const all = {'dev': dev};

  static const _currentName = String.fromEnvironment('CONFIG', defaultValue: 'dev');

  static const audioStreamUrl = 'https://project.office.utopiasoft.io/hls/projectslav/live.m3u8';
  static const audioStreamApiUrl = 'https://project.office.utopiasoft.io/api/nowplaying/projectslav';

  static final AppConfig current = all[_currentName]!;

  static const storageUrl = "https://hrtreeyiexbdvnlvzyjn.supabase.co/storage/v1/object/public/";

  static const policyUrl =
      "https://doc-hosting.flycricket.io/project-slav-privacy-policy/a7593d79-b201-4dad-9138-d7e4542f7598/privacy";

  static const termsUrl =
      "https://doc-hosting.flycricket.io/project-slav-terms-of-use/8b7b1f65-273d-47b7-a7f4-dbaf38bc71dc/terms";

  static String getStorageObjectUrl(String path, [String bucket = "default"]) => p.join(storageUrl, bucket, path);

  static List<String> audioPlayerCoverImages = List.generate(6, (index) => "$index.jpg");

  static const appVersion = "1.0.3";
}
