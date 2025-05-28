import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerController extends StateNotifier<AudioPlayer> {
  AudioPlayerController() : super(AudioPlayer());

  Future<void> load(String url) async {
    await state.setUrl(url);
  }

  void play() => state.play();
  void pause() => state.pause();
  void seek(Duration position) => state.seek(position);

  Future<void> togglePlayPause() async {
    if (state.playing) {
      await state.pause();
    } else {
      await state.play();
    }
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}
