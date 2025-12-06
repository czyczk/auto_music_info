import 'package:auto_music_info/core/providers/ami_service/models/dto/search_result_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_result_entry.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_source_enum.dart';

class SearchResults {
  SearchResults({required this.query, required this.resultMap});

  final String query;
  final Map<SearchSourceEnum, List<SearchResultEntry>> resultMap;

  factory SearchResults.fromIntegratedDto(
    Map<String, SearchResultDto> integratedDto,
  ) {
    if (integratedDto.isEmpty) {
      throw Exception('map is empty');
    }

    final query = integratedDto.entries.first.value.query;

    final resultMap = <SearchSourceEnum, List<SearchResultEntry>>{};
    for (final sourceEntry in integratedDto.entries) {
      final source = SearchSourceEnum.fromServerCode(sourceEntry.key);

      for (final resultEntryDto in sourceEntry.value.results) {
        if (resultMap.containsKey(source)) {
          resultMap[source]!.add(SearchResultEntry.fromDto(resultEntryDto));
        } else {
          resultMap[source] = [SearchResultEntry.fromDto(resultEntryDto)];
        }
      }
    }

    return SearchResults(query: query, resultMap: resultMap);
  }
}
