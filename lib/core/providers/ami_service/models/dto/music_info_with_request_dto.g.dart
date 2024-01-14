// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_info_with_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicInfoWithRequestDto _$MusicInfoWithRequestDtoFromJson(
        Map<String, dynamic> json) =>
    MusicInfoWithRequestDto(
      url: json['url'] as String,
      query: json['query'] as String,
      source: json['source'] as String,
      musicInfo:
          MusicInfoDto.fromJson(json['musicInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicInfoWithRequestDtoToJson(
        MusicInfoWithRequestDto instance) =>
    <String, dynamic>{
      'url': instance.url,
      'query': instance.query,
      'source': instance.source,
      'musicInfo': instance.musicInfo,
    };
