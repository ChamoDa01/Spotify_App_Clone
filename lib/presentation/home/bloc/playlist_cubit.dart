import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_app/presentation/home/bloc/playlist_state.dart';
import 'package:spotify_app/service_locator.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());
  Future<void> getPlaylist() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();
    returnedSongs.fold((l) {
      emit(PlaylistLoadError());
    }, (data) {
      emit(PlaylistLoaded(songs: data));
    });
  }
}
