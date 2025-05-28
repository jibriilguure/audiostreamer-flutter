import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/audio_track.dart';
import '../providers/audio_provider.dart';

import 'widgets/player_area.dart';
import 'widgets/track_header.dart';

class NowPlayingScreen extends ConsumerStatefulWidget {
  final AudioTrack track;
  const NowPlayingScreen({super.key, required this.track});

  @override
  ConsumerState<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends ConsumerState<NowPlayingScreen> {
  Duration _current = Duration.zero;
  Duration _total = Duration.zero;

  @override
  void initState() {
    super.initState();
    final player = ref.read(audioPlayerProvider);
    ref.read(audioPlayerProvider.notifier).load(widget.track.fileUrl);

    player.durationStream.listen((d) {
      if (d != null) setState(() => _total = d);
    });
    player.positionStream.listen((p) {
      setState(() => _current = p);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(audioPlayerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Playing', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        actions: [Icon(Icons.more_horiz, color: Colors.black)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            TrackHeader(track: widget.track),
            const SizedBox(height: 24),
            PlayerArea(current: _current, total: _total),
          ],
        ),
      ),
    );
  }
}
