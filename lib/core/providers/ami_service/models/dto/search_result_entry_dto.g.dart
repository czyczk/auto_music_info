// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultEntryDto _$SearchResultEntryDtoFromJson(
        Map<String, dynamic> json) =>
    SearchResultEntryDto()
      ..title = json['title'] as String
      ..url = json['url'] as String
      ..snippet = json['snippet'] as String
      ..site = json['site'] as String;

Map<String, dynamic> _$SearchResultEntryDtoToJson(
        SearchResultEntryDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'snippet': instance.snippet,
      'site': instance.site,
    };
