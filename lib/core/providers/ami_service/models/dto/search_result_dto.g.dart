// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultDto _$SearchResultDtoFromJson(Map<String, dynamic> json) =>
    SearchResultDto()
      ..provider = json['provider'] as String
      ..engine = json['engine'] as String
      ..query = json['query'] as String
      ..correctedQuery = json['correctedQuery'] as String?
      ..results = (json['results'] as List<dynamic>)
          .map((e) => SearchResultEntryDto.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchResultDtoToJson(SearchResultDto instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'engine': instance.engine,
      'query': instance.query,
      'correctedQuery': instance.correctedQuery,
      'results': instance.results,
    };
