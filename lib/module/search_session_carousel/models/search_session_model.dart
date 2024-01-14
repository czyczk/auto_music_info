import 'package:auto_music_info/core/common/models/wrapped_data.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_with_request.dart';
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

  SearchSessionPhaseMusicInfoResultsInfo phaseMusicInfoResultsInfo =
      SearchSessionPhaseMusicInfoResultsInfo.ofEmpty();
}

enum SearchSessionPhaseEnum {
  phaseKeyword,
  phaseSearchResults,
  phaseMusicInfoResults,
}

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

class SearchSessionPhaseMusicInfoResultsInfo {
  late final String query;
  String? correctedQuery;
  late final Map<SearchSourceEnum, List<SearchResultEntry>> selectedEntries;
  late bool isCompleted;
  late int totalCount;
  late int successCount;
  late int failureCount;
  late Map<SearchSourceEnum, List<WrappedData<MusicInfoWithRequest>?>>
      musicInfoMap;

  SearchSessionPhaseMusicInfoResultsInfo.ofEmpty() {
    query = "";
    correctedQuery = null;
    selectedEntries = {};
    isCompleted = false;
    totalCount = 0;
    successCount = 0;
    failureCount = 0;
    musicInfoMap = {};
  }

  SearchSessionPhaseMusicInfoResultsInfo.ofPending(
      {required this.query,
      this.correctedQuery,
      required this.selectedEntries}) {
    isCompleted = false;
    totalCount = selectedEntries.values
        .map((list) => list.length)
        .reduce((acc, listLength) => acc + listLength);
    successCount = 0;
    failureCount = 0;
    // Make room for the results of each map entry.
    musicInfoMap = {
      for (var k in selectedEntries.keys)
        k: List<WrappedData<MusicInfoWithRequest>?>.filled(
            selectedEntries[k]!.length, null)
    };
  }

  fillSuccessfulResult(
      SearchSourceEnum source, int index, MusicInfoWithRequest musicInfo) {
    musicInfoMap[source]![index] = WrappedData.ofData(musicInfo);
    successCount += 1;
    _tryFinalize();
  }

  fillFailedResult(SearchSourceEnum source, int index, Exception exception) {
    musicInfoMap[source]![index] = WrappedData.ofException(exception);
    failureCount += 1;
    _tryFinalize();
  }

  bool _tryFinalize() {
    if (successCount + failureCount == totalCount) {
      isCompleted = true;
      return true;
    } else {
      return false;
    }
  }
}
