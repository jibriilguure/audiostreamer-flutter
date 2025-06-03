import 'package:flutter/material.dart';

import '../../../data/models/audio_track.dart';

class SongListItemWidget extends StatelessWidget {
  final int index;
  final AudioTrack track;
  final VoidCallback? onTap;

  const SongListItemWidget({
    Key? key,
    required this.index,
    required this.track,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Cover image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                track.coverImageUrl,
                height: 100,
                width: double.infinity, // fills horizontally
                fit: BoxFit.cover, // maintains image aspect
                errorBuilder: (_, __, ___) => Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey[800],
                  child: const Icon(Icons.music_note, color: Colors.white70),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Title + Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    track.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500, // not bold
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    track.artist,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            const Icon(Icons.more_vert, color: Colors.white60, size: 20),
          ],
        ),
      ),
    );
  }
}
