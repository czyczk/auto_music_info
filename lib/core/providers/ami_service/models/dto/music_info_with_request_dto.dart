import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_request_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_info_with_request_dto.g.dart';

@JsonSerializable()
class MusicInfoWithRequestDto {
  final MusicInfoRequestDto request;
  final MusicInfoRequestDto? convertedRequest;
  final String source;
  final MusicInfoDto musicInfo;
  final String? think;
  final List<String> tools;

  MusicInfoWithRequestDto({
    required this.request,
    this.convertedRequest,
    required this.source,
    required this.musicInfo,
    this.think,
    required this.tools,
  });

  factory MusicInfoWithRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MusicInfoWithRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MusicInfoWithRequestDtoToJson(this);
}
