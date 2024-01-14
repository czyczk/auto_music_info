import 'package:json_annotation/json_annotation.dart';

part 'music_info_dto.g.dart';

@JsonSerializable()
class MusicInfoDto {
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

  MusicInfoDto({
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

  factory MusicInfoDto.fromJson(Map<String, dynamic> json) =>
      _$MusicInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MusicInfoDtoToJson(this);
}
