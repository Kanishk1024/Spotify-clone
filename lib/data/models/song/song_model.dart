import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
  late String title;
  late String artist;
  late num duration;
  late Timestamp release;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.release,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    release = data['release'];
  }
}

extension SongModelX on SongModel {
  SongEntities toEntity() {
    return SongEntities(
      title: title,
      artist: artist,
      duration: duration,
      release: release,
    );
  }
}
