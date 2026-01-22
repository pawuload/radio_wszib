import 'package:dio/dio.dart';
import 'package:project/app/app_config.dart';
import 'package:project/model/api/result/api_result.dart';
import 'package:project/model/song/song.dart';

typedef JsonMap = Map<String, dynamic>;

class RadioApiService {
  Future<ApiResult<SongModel>> fetchNowPlaying() async {
    try {
      final dio = Dio();
      final response = await dio.get<JsonMap>(AppConfig.audioStreamApiUrl);
      final song = response.data!['now_playing']['song'] as JsonMap;
      final model = SongModel(
          title: song['title'] as String, artworkUrl: song['art'] as String);
      return ApiResultData(model);
    } catch (e, s) {
      return ApiResultError(e, s);
    }
  }
}
