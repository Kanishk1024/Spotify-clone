import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs(SongModel songModel);
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  List<SongEntities> songs = [];
  @override
  Future<Either> getNewsSongs(SongModel songModel) async {
    var data = await FirebaseFirestore.instance
        .collection('songs')
        .orderBy('release', descending: true)
        .limit(3)
        .get();
    return Right(data);
  }
}
