// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_info_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicInfoRequestDto _$MusicInfoRequestDtoFromJson(Map<String, dynamic> json) =>
    MusicInfoRequestDto(
      query: json['query'] as String,
      url: json['url'] as String?,
      structuredDoc: json['structuredDoc'] as String?,
    );

Map<String, dynamic> _$MusicInfoRequestDtoToJson(
  MusicInfoRequestDto instance,
) => <String, dynamic>{
  'url': instance.url,
  'structuredDoc': instance.structuredDoc,
  'query': instance.query,
};
