import 'package:auto_music_info/core/providers/ami_service/models/text_language_enum.dart';

class HistoryDigestEntry {
  final String searchSessionId;
  final String query;
  final DateTime updateTime;
  final TextLanguageEnum textLanguage;

  HistoryDigestEntry(
      {required this.searchSessionId,
      required this.query,
      required this.updateTime,
      required this.textLanguage});
}
