import 'package:auto_music_info/core/providers/ami_service/models/search_result_entry.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_source_enum.dart';
import 'package:auto_music_info/core/providers/ami_service/models/text_language_enum.dart';

class SearchSession {
  SearchSession({required this.sessionId});

  final String sessionId;

  DateTime sessionUpdateTime = DateTime.now();

  SearchSessionPhaseEnum activePhase = SearchSessionPhaseEnum.phaseKeyword;

  SearchSessionPhaseEnum bestPhase = SearchSessionPhaseEnum.phaseKeyword;

  SearchSessionPhaseKeywordInfo phaseKeywordInfo =
      SearchSessionPhaseKeywordInfo();

  SearchSessionPhaseSearchResultsInfo phaseSearchResultsInfo =
      SearchSessionPhaseSearchResultsInfo.ofEmpty();
}

enum SearchSessionPhaseEnum { phaseKeyword, phaseSearchResults }

class SearchSessionPhaseKeywordInfo {
  String query = "";
  TextLanguageEnum textLanguage = TextLanguageEnum.notSpecified;
}

class SearchSessionPhaseSearchResultsInfo {
  SearchSessionPhaseSearchResultsInfo.ofEmpty() {
    query = "";
    correctedQuery = null;
    isCompleted = false;
    searchResultsMap = {};
  }

  SearchSessionPhaseSearchResultsInfo.ofPending(
      {required this.query, this.correctedQuery}) {
    isCompleted = false;
    searchResultsMap = {};
  }

  SearchSessionPhaseSearchResultsInfo.ofResults(
      {required this.query,
      this.correctedQuery,
      required this.searchResultsMap}) {
    isCompleted = true;
  }

  late final String query;
  String? correctedQuery;
  late bool isCompleted;
  late Map<SearchSourceEnum, List<SearchResultEntry>> searchResultsMap;
}
