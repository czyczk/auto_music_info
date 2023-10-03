import 'package:auto_music_info/core/providers/ami_service/history_service.dart';
import 'package:auto_music_info/core/providers/ami_service/models/history_digest_entry.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';

class HistoryServiceImpl extends HistoryService {
  @override
  Future<List<HistoryDigestEntry>> getHistoryDigestEntries() {
    // TODO: implement getHistoryDigestEntries
    throw UnimplementedError();
  }

  @override
  Future<void> addSearchSession(SearchSession searchSession) {
    // TODO: implement addSearchSession
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSearchSession(String searchSessionId) {
    // TODO: implement deleteSearchSession
    throw UnimplementedError();
  }

  @override
  Future<SearchSession> getSearchSession(String searchSessionId) {
    // TODO: implement getSearchSession
    throw UnimplementedError();
  }
}
