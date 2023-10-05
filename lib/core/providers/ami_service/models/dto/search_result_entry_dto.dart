import 'package:json_annotation/json_annotation.dart';

part 'search_result_entry_dto.g.dart';

@JsonSerializable()
class SearchResultEntryDto {
  late final String title;

  late final String url;

  late final String snippet;

  /// E.g. "en.wikipedia.org".
  late final String site;

  SearchResultEntryDto();

  factory SearchResultEntryDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResultEntryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultEntryDtoToJson(this);
}
