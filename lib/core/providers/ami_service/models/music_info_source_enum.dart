enum MusicInfoSourceEnum {
  ai('AI-powered', 'AI'),
  ruleBased('Rule-based', 'RULE_BASED'),
  ;

  final String displayText;
  final String serverCode;

  const MusicInfoSourceEnum(this.displayText, this.serverCode);

  static MusicInfoSourceEnum fromServerCode(String serverCode) {
    return MusicInfoSourceEnum.values.firstWhere(
      (element) => element.serverCode == serverCode,
      orElse: () => throw Exception('Unknown server code: $serverCode'),
    );
  }
}
