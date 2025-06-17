import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_playlist_songs.dart';
import 'package:spotify/presentation/root/bloc/play_list_state.dart';
import 'package:spotify/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlaylistUseCase>().call();
    returnedSongs.fold(
      (l) {
        emit(PlayListFailure());
      },
      (data) {
        emit(PlayListLoaded(songs: data));
      },
    );
  }
}
