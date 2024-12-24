abstract class SongPlayerState {}

class SongPlayerLoading extends SongPlayerState {}

class SongPlayerLoaded extends SongPlayerState {}

class SongPlayerLoadError extends SongPlayerState {
  final String message;

  SongPlayerLoadError({required this.message});
}
