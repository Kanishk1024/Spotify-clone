import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
  late String title;
  late String artist;
  late num duration;
  late Timestamp releaseDate;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'] as String;
    artist = data['artist'] as String;
    duration = data['duration'] as num;
    releaseDate = data['releaseDate'] as Timestamp;
  }
}

extension SongModelX on SongModel {
  SongEntities toEntity() {
    return SongEntities(
        title: title,
        artist: artist,
        duration: duration,
        releaseDate: releaseDate);
  }
}
