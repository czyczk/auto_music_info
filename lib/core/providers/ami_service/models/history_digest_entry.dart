import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';

class HistoryDigestEntry {
  final String searchSessionId;
  final String query;
  final DateTime updateTime;
  final SearchSessionTextLanguageEnum textLanguage;

  HistoryDigestEntry(
      {required this.searchSessionId,
      required this.query,
      required this.updateTime,
      required this.textLanguage});
}
