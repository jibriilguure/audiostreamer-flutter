import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/audio_provider.dart';

class PlayerArea extends ConsumerWidget {
  final Duration current;
  final Duration total;

  const PlayerArea({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(audioPlayerProvider);
    final isPlaying = player.playing;

    return Column(
      children: [
        // Progress Slider
        Slider(
          value: current.inSeconds.toDouble(),
          min: 0,
          max: total.inSeconds.toDouble(),
          onChanged: (value) {
            ref
                .read(audioPlayerProvider.notifier)
                .seek(Duration(seconds: value.toInt()));
          },
          activeColor: Colors.deepPurple,
          inactiveColor: Colors.deepPurpleAccent.withOpacity(0.2),
        ),

        // Time labels
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_format(current),
                  style: const TextStyle(color: Colors.grey)),
              Text(_format(total), style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.shuffle, size: 28, color: Colors.black54),
            const Icon(Icons.skip_previous, size: 36, color: Colors.black87),

            // ✅ Play/Pause Toggle
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                size: 64,
                color: Colors.deepPurple,
              ),
              onPressed: () {
                ref.read(audioPlayerProvider.notifier).togglePlayPause();
              },
            ),

            const Icon(Icons.skip_next, size: 36, color: Colors.black87),
            const Icon(Icons.repeat, size: 28, color: Colors.black54),
          ],
        ),
      ],
    );
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.inMinutes)}:${two(d.inSeconds % 60)}";
  }
}
