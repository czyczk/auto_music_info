enum TextLanguageEnum {
  notSpecified('NOT_SPECIFIED'),
  cyrillic('CYRILLIC'),
  latin('LATIN'),
  japanese('JAPANESE'),
  korean('KOREAN'),
  zhHans('ZH_HANS'),
  zhHant('ZH_HANT'),
  ;

  final String serverCode;

  const TextLanguageEnum(this.serverCode);
}
