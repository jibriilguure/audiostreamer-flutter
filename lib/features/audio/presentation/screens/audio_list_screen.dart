import 'package:audio_streamer/features/audio/presentation/screens/now_playing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/audio_provider.dart';
import 'widgets/audio_tile_widget.dart';

class AudioListScreen extends ConsumerWidget {
  const AudioListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracksAsync = ref.watch(audioTracksProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Audio Tracks')),
      body: tracksAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (tracks) => ListView.builder(
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            final track = tracks[index];
            return AudioTileWidget(
              track: track,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NowPlayingScreen(
                      track: track,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
