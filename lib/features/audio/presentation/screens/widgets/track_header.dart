import 'package:flutter/material.dart';
import '../../../data/models/audio_track.dart';

class TrackHeader extends StatelessWidget {
  final AudioTrack track;

  const TrackHeader({super.key, required this.track});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            track.coverImageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/img/default_cover.png',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Text(track.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(track.artist,
            style: const TextStyle(fontSize: 16, color: Colors.deepPurple)),
      ],
    );
  }
}
