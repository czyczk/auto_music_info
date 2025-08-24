import 'package:auto_music_info/core/providers/ami_service/models/search_source_enum.dart';

class FailedMusicInfoResultException implements Exception {
  final Exception cause;
  final SearchSourceEnum searchSource;
  final int index;
  final String url;

  FailedMusicInfoResultException({
    required this.cause,
    required this.searchSource,
    required this.index,
    required this.url,
  });

  @override
  String toString() => 'FailedMusicInfoResultException: $cause';
}
