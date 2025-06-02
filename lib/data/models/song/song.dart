import 'package:cloud_firestore/cloud_firestore.dart';

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
