enum SearchSourceEnum {
  wikipedia('Wikipedia'),
  musicPlatforms('Music Platforms'),
  other('Other'),
  ;

  final String displayText;

  const SearchSourceEnum(this.displayText);
}
