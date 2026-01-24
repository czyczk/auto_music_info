// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicInfoDto _$MusicInfoDtoFromJson(Map<String, dynamic> json) => MusicInfoDto(
  artists: (json['artists'] as List<dynamic>).map((e) => e as String).toList(),
  title: json['title'] as String,
  pageType: json['pageType'] as String,
  album: json['album'] as String?,
  date: json['date'] as String?,
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  trackNo: (json['trackNo'] as num?)?.toInt(),
  totalTracks: (json['totalTracks'] as num?)?.toInt(),
  discNo: (json['discNo'] as num?)?.toInt(),
  totalDiscs: (json['totalDiscs'] as num?)?.toInt(),
  composers: (json['composers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  lyricists: (json['lyricists'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  arrangers: (json['arrangers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  confidence: json['confidence'] as String?,
  lowConfidenceReason: json['lowConfidenceReason'] as String?,
);

Map<String, dynamic> _$MusicInfoDtoToJson(MusicInfoDto instance) =>
    <String, dynamic>{
      'artists': instance.artists,
      'title': instance.title,
      'pageType': instance.pageType,
      'album': instance.album,
      'date': instance.date,
      'genres': instance.genres,
      'trackNo': instance.trackNo,
      'totalTracks': instance.totalTracks,
      'discNo': instance.discNo,
      'totalDiscs': instance.totalDiscs,
      'composers': instance.composers,
      'lyricists': instance.lyricists,
      'arrangers': instance.arrangers,
      'confidence': instance.confidence,
      'lowConfidenceReason': instance.lowConfidenceReason,
    };
