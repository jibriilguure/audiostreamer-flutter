class AudioTrack {
  final int id;
  final String title;
  final String artist;
  final String fileUrl;
  final String coverImageUrl;
  final DateTime uploadedAt;

  AudioTrack({
    required this.id,
    required this.title,
    required this.artist,
    required this.fileUrl,
    required this.coverImageUrl,
    required this.uploadedAt,
  });

  factory AudioTrack.fromJson(Map<String, dynamic> json) {
    return AudioTrack(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      fileUrl: json['fileUrl'] ?? '',
      coverImageUrl: json['coverImageUrl'] ?? '',
      uploadedAt: json['uploadedAt'] != null
          ? DateTime.parse(json['uploadedAt'])
          : DateTime.now(), // or handle differently
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'fileUrl': fileUrl,
      'coverImageUrl': coverImageUrl,
      'uploadedAt': uploadedAt.toIso8601String(),
    };
  }
}
