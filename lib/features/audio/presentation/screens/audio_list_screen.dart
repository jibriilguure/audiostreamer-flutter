import 'package:audio_streamer/features/audio/presentation/screens/widgets/song_grid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/now_playing_screen.dart';
import '../providers/audio_provider.dart';

class AudioListSection extends ConsumerWidget {
  const AudioListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracksAsync = ref.watch(audioTracksProvider);

    return tracksAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
      error: (err, _) => Text(
        'Error: $err',
        style: const TextStyle(color: Colors.redAccent),
      ),
      data: (tracks) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: tracks.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final track = tracks[index];
          return GridTrackItemWidget(
            track: track,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NowPlayingScreen(track: track),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
