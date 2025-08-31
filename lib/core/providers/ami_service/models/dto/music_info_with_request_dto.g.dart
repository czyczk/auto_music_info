// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_info_with_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicInfoWithRequestDto _$MusicInfoWithRequestDtoFromJson(
  Map<String, dynamic> json,
) => MusicInfoWithRequestDto(
  request: MusicInfoRequestDto.fromJson(
    json['request'] as Map<String, dynamic>,
  ),
  source: json['source'] as String,
  musicInfo: MusicInfoDto.fromJson(json['musicInfo'] as Map<String, dynamic>),
  think: json['think'] as String?,
);

Map<String, dynamic> _$MusicInfoWithRequestDtoToJson(
  MusicInfoWithRequestDto instance,
) => <String, dynamic>{
  'request': instance.request,
  'source': instance.source,
  'musicInfo': instance.musicInfo,
  'think': instance.think,
};
