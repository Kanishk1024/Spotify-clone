import 'package:dartz/dartz.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongRepository>().getNewSongs();
  }
}
