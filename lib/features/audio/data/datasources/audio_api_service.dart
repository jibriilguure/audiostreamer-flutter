import 'package:dio/dio.dart';
import '../models/audio_track.dart';

class AudioApiService {
  final Dio _dio = Dio();
  final String ipAddress = "192.168.0.174"; // for local develompent

  Future<List<AudioTrack>> fetchTracks() async {
    try {
      final response =
          await _dio.get('http://$ipAddress:8080/api/v1/audiofiles');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => AudioTrack.fromJson(json)).toList();
      } else {
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
}
