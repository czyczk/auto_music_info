import 'package:auto_music_info/core/providers/ami_service/models/dto/search_result_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_result_entry.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_source_enum.dart';

class SearchResults {
  SearchResults(
      {required this.serviceProvider,
      required this.query,
      this.correctedQuery,
      required this.resultMap});

  final String serviceProvider;
  final String query;
  final String? correctedQuery;
  final Map<SearchSourceEnum, List<SearchResultEntry>> resultMap;

  factory SearchResults.fromIntegratedDto(
      Map<String, SearchResultDto> integratedDto) {
    if (integratedDto.isEmpty) {
      throw Exception('map is empty');
    }

    final searchProvider = integratedDto.entries.first.value.provider;
    final query = integratedDto.entries.first.value.query;
    final correctedQuery = integratedDto.entries.first.value.correctedQuery;

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

    return SearchResults(
      serviceProvider: searchProvider,
      query: query,
      correctedQuery: correctedQuery,
      resultMap: resultMap,
    );
  }
}
