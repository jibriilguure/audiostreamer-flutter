import 'package:flutter/material.dart';

import '../../data/models/demo_audio_track.dart';
import '../audio_test_screen.dart';
import 'widgets/audio_tile_widget.dart';

class AudioListScreen extends StatelessWidget {
  const AudioListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Tracks')),
      body: ListView.builder(
        itemCount: demoTracks.length,
        itemBuilder: (context, index) {
          final track = demoTracks[index];
          return AudioTileWidget(
            track: track,
            onTap: () {
              // TODO: Handle play audio
              print('Tapped on: ${track.title}');
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => AudioPlayerScreen()));
            },
          );
        },
      ),
    );
  }
}
