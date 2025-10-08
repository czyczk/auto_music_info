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
  convertedRequest: json['convertedRequest'] == null
      ? null
      : MusicInfoRequestDto.fromJson(
          json['convertedRequest'] as Map<String, dynamic>,
        ),
  source: json['source'] as String,
  musicInfo: MusicInfoDto.fromJson(json['musicInfo'] as Map<String, dynamic>),
  think: json['think'] as String?,
  tools: (json['tools'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$MusicInfoWithRequestDtoToJson(
  MusicInfoWithRequestDto instance,
) => <String, dynamic>{
  'request': instance.request,
  'convertedRequest': instance.convertedRequest,
  'source': instance.source,
  'musicInfo': instance.musicInfo,
  'think': instance.think,
  'tools': instance.tools,
};
