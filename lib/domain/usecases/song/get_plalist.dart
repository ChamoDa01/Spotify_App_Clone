import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecases/usecase.dart';
import 'package:spotify_app/domain/repository/song/song.dart';
import 'package:spotify_app/service_locator.dart';

class GetPlaylistUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getPlaylist();
  }
}
