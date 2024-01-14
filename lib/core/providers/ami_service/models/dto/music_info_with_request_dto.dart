import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_info_with_request_dto.g.dart';

@JsonSerializable()
class MusicInfoWithRequestDto {
  final String url;
  final String query;
  final String source;
  final MusicInfoDto musicInfo;

  MusicInfoWithRequestDto({
    required this.url,
    required this.query,
    required this.source,
    required this.musicInfo,
  });

  factory MusicInfoWithRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MusicInfoWithRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MusicInfoWithRequestDtoToJson(this);
}
