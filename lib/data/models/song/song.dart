import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_app/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  String? image;
  String? url;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.image,
    required this.url,
  });

  SongModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        artist = json['artist'],
        duration = json['duration'],
        releaseDate = json['releaseDate'],
        image = json['image'],
        url = json['url'];
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      image: image!,
      url: url!,
    );
  }
}
