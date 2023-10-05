import 'package:auto_music_info/core/providers/ami_service/models/dto/search_result_entry_dto.dart';

class SearchResultEntry {
  SearchResultEntry(
      {required this.title,
      required this.url,
      required this.snippet,
      required this.site});

  final String title;

  final String url;

  final String snippet;

  /// E.g. "en.wikipedia.org".
  final String site;

  factory SearchResultEntry.fromDto(SearchResultEntryDto dto) {
    return SearchResultEntry(
      title: dto.title,
      url: dto.url,
      snippet: dto.snippet,
      site: dto.site,
    );
  }
}
