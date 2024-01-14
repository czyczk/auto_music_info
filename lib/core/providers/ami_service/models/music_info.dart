import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_dto.dart';

class MusicInfo {
  final List<String> artists;
  final String title;
  final String? album;
  final String? date;
  final int? trackNo;
  final List<String>? composers;
  final List<String>? lyricists;
  final List<String>? arrangers;
  final String? confidence;
  final String? lowConfidenceReason;

  MusicInfo({
    required this.artists,
    required this.title,
    this.album,
    this.date,
    this.trackNo,
    this.composers,
    this.lyricists,
    this.arrangers,
    this.confidence,
    this.lowConfidenceReason,
  });

  factory MusicInfo.fromDto(MusicInfoDto dto) {
    return MusicInfo(
      artists: dto.artists,
      title: dto.title,
      album: dto.album,
      date: dto.date,
      trackNo: dto.trackNo,
      composers: dto.composers,
      lyricists: dto.lyricists,
      arrangers: dto.arrangers,
      confidence: dto.confidence,
      lowConfidenceReason: dto.lowConfidenceReason,
    );
  }
}
