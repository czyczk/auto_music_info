import 'package:auto_music_info/core/providers/ami_service/models/text_language_enum.dart';
import 'package:flutter/painting.dart';

List<String> _latinFonts = [
  'Roboto',
  'Segoe UI',
  'Arial',
];

List<String> _zhHansFonts = [
  'Sarasa UI SC',
  'Notosans CJK SC',
  'Microsoft YaHei UI',
];

List<String> _zhHantFonts = [
  'Sarasa UI TC',
  'Notosans CJK TC',
  'Microsoft JhengHei UI',
];

List<String> _japaneseFonts = [
  'Sarasa UI J',
  'Notosans CJK JP',
  'Meiryo UI',
];

List<String> _koreanFonts = [
  'Sarasa UI K',
  'Notosans CJK KR',
  'Malgun Gothic',
];

Map<TextLanguageEnum, List<String>> _textLanguageFontFamilyFallbackMap = {
  TextLanguageEnum.notSpecified: [
    ..._latinFonts,
    ..._zhHansFonts,
    ..._zhHantFonts,
    ..._japaneseFonts,
    ..._koreanFonts,
  ],
  TextLanguageEnum.cyrillic: [
    ..._latinFonts,
    ..._zhHansFonts,
    ..._zhHantFonts,
    ..._japaneseFonts,
    ..._koreanFonts,
  ],
  TextLanguageEnum.latin: [
    ..._latinFonts,
    ..._zhHansFonts,
    ..._zhHantFonts,
    ..._japaneseFonts,
    ..._koreanFonts,
  ],
  TextLanguageEnum.japanese: [
    ..._latinFonts,
    ..._japaneseFonts,
    ..._koreanFonts,
    ..._zhHantFonts,
    ..._zhHansFonts,
  ],
  TextLanguageEnum.korean: [
    ..._latinFonts,
    ..._koreanFonts,
    ..._japaneseFonts,
    ..._zhHantFonts,
    ..._zhHansFonts,
  ],
  TextLanguageEnum.zhHans: [
    ..._latinFonts,
    ..._zhHansFonts,
    ..._zhHantFonts,
    ..._japaneseFonts,
    ..._koreanFonts,
  ],
  TextLanguageEnum.zhHant: [
    ..._latinFonts,
    ..._zhHantFonts,
    ..._zhHansFonts,
    ..._japaneseFonts,
    ..._koreanFonts,
  ],
};

TextStyle determineTextStyle(TextLanguageEnum? textLanguage) {
  return TextStyle(
    fontFamily: determineFontFamily(),
    fontFamilyFallback: determineFontFamilyFallback(textLanguage),
  );
}

String determineFontFamily() {
  return 'Roboto';
}

List<String> determineFontFamilyFallback(TextLanguageEnum? textLanguage) {
  textLanguage ??= TextLanguageEnum.notSpecified;

  return _textLanguageFontFamilyFallbackMap[textLanguage]!;
}
