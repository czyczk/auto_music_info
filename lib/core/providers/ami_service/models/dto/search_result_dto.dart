import 'package:auto_music_info/core/providers/ami_service/models/dto/search_result_entry_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result_dto.g.dart';

@JsonSerializable()
class SearchResultDto {
  late final String provider;

  late final String engine;

  late final String query;

  late final String? correctedQuery;

  late final List<SearchResultEntryDto> results;

  SearchResultDto();

  factory SearchResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultDtoToJson(this);
}
