import 'package:flutter/material.dart';
import '../../../data/models/audio_track.dart';

class GridTrackItemWidget extends StatelessWidget {
  final AudioTrack track;
  final VoidCallback? onTap;

  const GridTrackItemWidget({
    Key? key,
    required this.track,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: track.coverImageUrl.isNotEmpty
                ? Image.network(
                    track.coverImageUrl,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.grey[800],
                      child:
                          const Icon(Icons.music_note, color: Colors.white70),
                    ),
                  )
                : Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey[800],
                    child: const Icon(Icons.music_note, color: Colors.white70),
                  ),
          ),

          const SizedBox(height: 6),

          // Track title
          Text(
            track.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // Artist name
          Text(
            track.artist,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
