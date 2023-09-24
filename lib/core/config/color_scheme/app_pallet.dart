import 'dart:ui';

abstract class AppPalette {
  static const darkGrayBlue = _DarkGrayBlueColors();
  static const darkGrayerBlue = _DarkGrayerBlueColors();
  static const darkGrayGreen = _DeepGrayGreenColors();
  static const coolGray = _CoolGrayColors();
  static const warmGray = _WarmGrayColors();
  static const moderateVividOrange = _ModerateVividOrangeColors();
}

abstract class ColorSet {
  const ColorSet();

  Color get background;

  Color get backgroundHover;

  Color get backgroundActive;

  Color get backgroundDisabled;

  Color get foreground;

  Color get foregroundHover;

  Color get foregroundActive;

  Color get foregroundDisabled;
}

class _DarkGrayBlueColors extends ColorSet {
  const _DarkGrayBlueColors();

  @override
  final background = const Color(0xFF283440);
  @override
  final backgroundHover = const Color(0xFF47515C);
  @override
  final backgroundActive = const Color(0xFF394552);
  @override
  final backgroundDisabled = const Color(0xFF353535);

  @override
  final foreground = const Color(0xFF9EA5AC);
  @override
  final foregroundHover = const Color(0xFFD4D4D6);

  @override
  Color get foregroundActive => foreground;
  @override
  final foregroundDisabled = const Color(0xFFB5B5B5);
}

class _DarkGrayerBlueColors extends ColorSet {
  const _DarkGrayerBlueColors();

  @override
  final background = const Color(0xFF343A40);
  @override
  final backgroundHover = const Color(0xFF4B535C);
  @override
  final backgroundActive = const Color(0xFF434A52);
  @override
  final backgroundDisabled = const Color(0xFF3A3A3A);

  @override
  final foreground = const Color(0xFF9EA5AC);
  @override
  final foregroundHover = const Color(0xFFEFEFF1);
  @override
  final foregroundActive = const Color(0xFFD4D4D6);
  @override
  final foregroundDisabled = const Color(0xFFE5E5E5);
}

class _DeepGrayGreenColors extends ColorSet {
  const _DeepGrayGreenColors();

  @override
  final background = const Color(0xFF294135);
  @override
  final backgroundHover = const Color(0xFF475C51);
  @override
  final backgroundActive = const Color(0xFF3B5146);
  @override
  final backgroundDisabled = const Color(0xFF353535);

  @override
  final foreground = const Color(0xFF9EACA5);
  @override
  final foregroundHover = const Color(0xFFEFF1EF);
  @override
  final foregroundActive = const Color(0xFFD4D6D4);
  @override
  final foregroundDisabled = const Color(0xFFB5B5B5);
}

class _CoolGrayColors extends ColorSet {
  const _CoolGrayColors();

  @override
  final background = const Color(0xFFECEDF3);
  @override
  final backgroundHover = const Color(0xFFF5F6FB);
  @override
  final backgroundActive = const Color(0xFFDCDDE3);
  @override
  final backgroundDisabled = const Color(0xFFEAEAEA);

  @override
  final foreground = const Color(0xFF525252);
  @override
  final foregroundHover = const Color(0xFF828282);
  @override
  final foregroundActive = const Color(0xFF383D49);
  @override
  final foregroundDisabled = const Color(0xFF525252);
}

class _WarmGrayColors extends ColorSet {
  const _WarmGrayColors();

  @override
  final background = const Color(0xFFF4F4F5);
  @override
  final backgroundHover = const Color(0xFFE9E9EA);
  @override
  final backgroundActive = const Color(0xFFE0E0E1);
  @override
  final backgroundDisabled = const Color(0xFFEAEAEA);

  @override
  final foreground = const Color(0xFF525252);
  @override
  final foregroundHover = const Color(0xFF828282);
  @override
  final foregroundActive = const Color(0xFF383D49);
  @override
  final foregroundDisabled = const Color(0xFF525252);
}

class _ModerateVividOrangeColors extends ColorSet {
  const _ModerateVividOrangeColors();

  @override
  final background = const Color(0xFFE57E31);
  @override
  final backgroundHover = const Color(0xFFF48D38);
  @override
  final backgroundActive = const Color(0xFFDF782B);
  @override
  final backgroundDisabled = const Color(0xFF5E5E5E);

  @override
  final foreground = const Color(0xFFE8E7E6);
  @override
  final foregroundHover = const Color(0xFFF1F0EF);
  @override
  final foregroundActive = const Color(0xFFD6D5D4);
  @override
  final foregroundDisabled = const Color(0xFFB5B5B5);
}
