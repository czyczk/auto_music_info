import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_dto.dart';

class MusicInfo {
  final List<String> artists;
  final String title;
  final String pageType;
  final String? album;
  final String? date;
  final List<String>? genres;
  final int? trackNo;
  final int? totalTracks;
  final int? discNo;
  final int? totalDiscs;
  final List<String>? composers;
  final List<String>? lyricists;
  final List<String>? arrangers;
  final String? confidence;
  final String? lowConfidenceReason;

  MusicInfo({
    required this.artists,
    required this.title,
    required this.pageType,
    this.album,
    this.date,
    this.genres,
    this.trackNo,
    this.totalTracks,
    this.discNo,
    this.totalDiscs,
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
      pageType: dto.pageType,
      album: dto.album,
      date: dto.date,
      genres: dto.genres,
      trackNo: dto.trackNo,
      totalTracks: dto.totalTracks,
      discNo: dto.discNo,
      totalDiscs: dto.totalDiscs,
      composers: dto.composers,
      lyricists: dto.lyricists,
      arrangers: dto.arrangers,
      confidence: dto.confidence,
      lowConfidenceReason: dto.lowConfidenceReason,
    );
  }
}
