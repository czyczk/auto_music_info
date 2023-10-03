import 'package:auto_music_info/core/providers/ami_service/models/history_digest_entry.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:flutter/foundation.dart';

abstract class HistoryService with ChangeNotifier {
  Future<List<HistoryDigestEntry>> getHistoryDigestEntries();

  Future<SearchSession> getSearchSession(String searchSessionId);

  Future<void> addSearchSession(SearchSession searchSession);

  Future<void> deleteSearchSession(String searchSessionId);
}
