import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/sources/song/song_firbase_service.dart';
import 'package:spotify_app/domain/repository/song/song.dart';
import 'package:spotify_app/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlaylist() async {
    return await sl<SongFirebaseService>().getPlaylist();
  }
}
