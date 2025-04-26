import 'package:flutter/material.dart';

import '../../../data/models/audio_track.dart';

class AudioTileWidget extends StatelessWidget {
  final AudioTrack track;
  final VoidCallback? onTap;

  const AudioTileWidget({
    Key? key,
    required this.track,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: track.coverImageUrl.isNotEmpty
          ? Image.network(
              track.coverImageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/img/default_cover.png',
                  height: 50,
                  width: 40,
                  fit: BoxFit.cover,
                );
              },
            )
          : Icon(Icons.music_note),
      title: Text(track.title),
      subtitle: Text(track.artist),
      onTap: onTap,
    );
  }
}
