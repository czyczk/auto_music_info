import 'package:auto_music_info/core/providers/ami_service/history_service.dart';
import 'package:auto_music_info/core/providers/ami_service/models/history_digest_entry.dart';
import 'package:auto_music_info/core/providers/ami_service/search_service.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';

class DummyHistoryServiceImpl extends HistoryService {
  final SearchService _searchService;
  final List<SearchSession> _dummyHistorySearchSession = [];
  bool isInitialized = false;

  DummyHistoryServiceImpl(this._searchService);

  Future<void> _ensureInit() async {
    if (isInitialized) {
      return;
    }

    {
      final SearchSession session = SearchSession(sessionId: '1');
      const String query = 'Bad Bunny - Ignorantes (feat. Sech)';
      session.sessionUpdateTime = DateTime.utc(2023, 10, 3, 15, 39, 23);
      session.activePhase = SearchSessionPhaseEnum.phaseSearchResults;
      session.bestPhase = SearchSessionPhaseEnum.phaseSearchResults;

      session.phaseKeywordInfo = SearchSessionPhaseKeywordInfo();
      session.phaseKeywordInfo.query = query;
      session.phaseKeywordInfo.textLanguage = SearchSessionTextLanguageEnum.es;

      session.phaseSearchResultsInfo =
          SearchSessionPhaseSearchResultsInfo.ofResults(
        query: query,
        searchResultsMap:
            (await _searchService.searchWithKeyword(query)).resultMap,
      );

      _dummyHistorySearchSession.add(session);
    }

    {
      final SearchSession session = SearchSession(sessionId: '2');
      const String query =
          'long long long long long long long long long long long long long long long long';
      session.sessionUpdateTime = DateTime.utc(2023, 10, 3, 16, 5, 3);
      session.activePhase = SearchSessionPhaseEnum.phaseSearchResults;
      session.bestPhase = SearchSessionPhaseEnum.phaseSearchResults;

      session.phaseKeywordInfo = SearchSessionPhaseKeywordInfo();
      session.phaseKeywordInfo.query = query;
      session.phaseKeywordInfo.textLanguage = SearchSessionTextLanguageEnum.en;

      session.phaseSearchResultsInfo =
          SearchSessionPhaseSearchResultsInfo.ofResults(
        query: query,
        searchResultsMap:
            (await _searchService.searchWithKeyword(query)).resultMap,
      );

      _dummyHistorySearchSession.add(session);
    }

    {
      final SearchSession session = SearchSession(sessionId: '3');
      const String query = '简体中文示例 - zhCn';
      session.sessionUpdateTime = DateTime.utc(2023, 10, 3, 16, 13, 52);
      session.activePhase = SearchSessionPhaseEnum.phaseSearchResults;
      session.bestPhase = SearchSessionPhaseEnum.phaseSearchResults;

      session.phaseKeywordInfo = SearchSessionPhaseKeywordInfo();
      session.phaseKeywordInfo.query = query;
      session.phaseKeywordInfo.textLanguage =
          SearchSessionTextLanguageEnum.zhCn;

      session.phaseSearchResultsInfo =
          SearchSessionPhaseSearchResultsInfo.ofResults(
        query: query,
        searchResultsMap:
            (await _searchService.searchWithKeyword(query)).resultMap,
      );

      _dummyHistorySearchSession.add(session);
    }

    {
      final SearchSession session = SearchSession(sessionId: '4');
      const String query = '繁體中文示例 - zhTw';
      session.sessionUpdateTime = DateTime.utc(2023, 10, 3, 16, 21, 44);
      session.activePhase = SearchSessionPhaseEnum.phaseSearchResults;
      session.bestPhase = SearchSessionPhaseEnum.phaseSearchResults;

      session.phaseKeywordInfo = SearchSessionPhaseKeywordInfo();
      session.phaseKeywordInfo.query = query;
      session.phaseKeywordInfo.textLanguage =
          SearchSessionTextLanguageEnum.zhTw;

      session.phaseSearchResultsInfo =
          SearchSessionPhaseSearchResultsInfo.ofResults(
        query: query,
        searchResultsMap:
            (await _searchService.searchWithKeyword(query)).resultMap,
      );

      _dummyHistorySearchSession.add(session);
    }

    {
      final SearchSession session = SearchSession(sessionId: '5');
      const String query = '日本語のサンプル - ja';
      session.sessionUpdateTime = DateTime.utc(2023, 10, 3, 16, 23, 15);
      session.activePhase = SearchSessionPhaseEnum.phaseSearchResults;
      session.bestPhase = SearchSessionPhaseEnum.phaseSearchResults;

      session.phaseKeywordInfo = SearchSessionPhaseKeywordInfo();
      session.phaseKeywordInfo.query = query;
      session.phaseKeywordInfo.textLanguage = SearchSessionTextLanguageEnum.ja;

      session.phaseSearchResultsInfo =
          SearchSessionPhaseSearchResultsInfo.ofResults(
        query: query,
        searchResultsMap:
            (await _searchService.searchWithKeyword(query)).resultMap,
      );

      _dummyHistorySearchSession.add(session);
    }

    isInitialized = true;
  }

  @override
  Future<List<HistoryDigestEntry>> getHistoryDigestEntries() async {
    await _ensureInit();
    return _dummyHistorySearchSession
        .map((e) => HistoryDigestEntry(
              searchSessionId: e.sessionId,
              query: e.phaseKeywordInfo.query,
              updateTime: e.sessionUpdateTime,
              textLanguage: e.phaseKeywordInfo.textLanguage,
            ))
        .toList();
  }

  @override
  Future<void> addSearchSession(SearchSession searchSession) async {
    await _ensureInit();
    _dummyHistorySearchSession.add(searchSession);
  }

  @override
  Future<void> deleteSearchSession(String searchSessionId) async {
    await _ensureInit();
    _dummyHistorySearchSession
        .removeWhere((element) => element.sessionId == searchSessionId);
  }

  @override
  Future<SearchSession> getSearchSession(String searchSessionId) async {
    await _ensureInit();
    return _dummyHistorySearchSession
        .firstWhere((element) => element.sessionId == searchSessionId);
  }
}
