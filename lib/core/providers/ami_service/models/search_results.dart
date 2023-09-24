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
}
