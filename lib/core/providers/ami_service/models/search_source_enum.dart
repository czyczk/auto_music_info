enum SearchSourceEnum {
  wikipedia('Wikipedia', 'WIKIPEDIA'),
  musicPlatforms('Music Platforms', 'MUSIC_PLATFORM'),
  other('Other', 'ENTIRE'),
  ;

  final String displayText;

  final String serverCode;

  const SearchSourceEnum(this.displayText, this.serverCode);

  static SearchSourceEnum fromServerCode(String serverCode) {
    return SearchSourceEnum.values.firstWhere(
      (element) => element.serverCode == serverCode,
      orElse: () => throw Exception('Unknown server code: $serverCode'),
    );
  }
}
