import 'package:spotify/domain/entities/song/song.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntities> songs;

  PlayListLoaded({required this.songs});
}

class PlayListFailure extends PlayListState {}
