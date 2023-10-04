import 'package:auto_music_info/core/providers/ami_service/models/search_result_entry_dto.dart';

class SearchResultDto {
  late final String provider;

  late final String engine;

  late final String query;

  late final String? correctedQuery;

  late final List<SearchResultEntryDto> results;
}
