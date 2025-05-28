import 'package:just_audio/just_audio.dart';
import 'package:riverpod/riverpod.dart';
import '../../data/models/audio_track.dart';
import '../../data/datasources/audio_api_service.dart';
import 'audio_player_controller.dart';

// Provider for API service
final _audioApiServiceProvider =
    Provider<AudioApiService>((ref) => AudioApiService());

// FutureProvider to fetch the data
final audioTracksProvider = FutureProvider<List<AudioTrack>>((ref) async {
  final apiService = ref.read(_audioApiServiceProvider);
  return apiService.fetchTracks();
});

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerController, AudioPlayer>((ref) {
  return AudioPlayerController();
});
