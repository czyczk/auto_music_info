import 'package:auto_music_info/core/config/color_scheme/app_colors_extension.dart';
import 'package:auto_music_info/core/config/color_scheme/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /*
   * Light theme
   */

  static final light = ThemeData.light().copyWith(extensions: [
    _lightAppColorSchemeExtended,
  ]);

  static final _lightAppColorSchemeExtended = AppColorsExtension(
    // Primary: Dark gray blue
    primary: AppPalette.darkGrayBlue.background,
    primaryHover: AppPalette.darkGrayBlue.backgroundHover,
    primaryActive: AppPalette.darkGrayBlue.backgroundActive,
    primaryDisabled: AppPalette.darkGrayBlue.backgroundDisabled,
    onPrimary: AppPalette.darkGrayBlue.foreground,
    onPrimaryHover: AppPalette.darkGrayBlue.foregroundHover,
    onPrimaryActive: AppPalette.darkGrayBlue.foregroundActive,
    onPrimaryDisabled: AppPalette.darkGrayBlue.foregroundDisabled,
    // Secondary: Dark gray green
    secondary: AppPalette.darkGrayGreen.background,
    secondaryHover: AppPalette.darkGrayGreen.backgroundHover,
    secondaryActive: AppPalette.darkGrayGreen.backgroundActive,
    secondaryDisabled: AppPalette.darkGrayGreen.backgroundDisabled,
    onSecondary: AppPalette.darkGrayGreen.foreground,
    onSecondaryHover: AppPalette.darkGrayGreen.foregroundHover,
    onSecondaryActive: AppPalette.darkGrayGreen.foregroundActive,
    onSecondaryDisabled: AppPalette.darkGrayGreen.foregroundDisabled,
    // Tertiary: Moderate vivid orange
    tertiary: AppPalette.moderateVividOrange.background,
    tertiaryHover: AppPalette.moderateVividOrange.backgroundHover,
    tertiaryActive: AppPalette.moderateVividOrange.backgroundActive,
    tertiaryDisabled: AppPalette.moderateVividOrange.backgroundDisabled,
    onTertiary: AppPalette.moderateVividOrange.foreground,
    onTertiaryHover: AppPalette.moderateVividOrange.foregroundHover,
    onTertiaryActive: AppPalette.moderateVividOrange.foregroundActive,
    onTertiaryDisabled: AppPalette.moderateVividOrange.foregroundDisabled,
    // Quaternary: Light gray
    quaternary: AppPalette.coolGray.background,
    quaternaryHover: AppPalette.coolGray.backgroundHover,
    quaternaryActive: AppPalette.coolGray.backgroundActive,
    quaternaryDisabled: AppPalette.coolGray.backgroundDisabled,
    onQuaternary: AppPalette.coolGray.foreground,
    onQuaternaryHover: AppPalette.coolGray.foregroundHover,
    onQuaternaryActive: AppPalette.coolGray.foregroundActive,
    onQuaternaryDisabled: AppPalette.coolGray.foregroundDisabled,
    // Other
    background: AppPalette.coolGray.background,
    onBackground: AppPalette.coolGray.foreground,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static final lightColorScheme =
      _getColorSchemeBasedOnSeed(Colors.indigo, _lightAppColorSchemeExtended);

  static ColorScheme _getColorSchemeBasedOnSeed(
      Color seedColor, AppColorsExtension appColors) {
    ColorScheme baseColorScheme = ColorScheme.fromSeed(seedColor: seedColor);
    return ColorScheme(
        brightness: Brightness.light,
        primary: appColors.primary,
        onPrimary: appColors.onPrimary,
        secondary: appColors.secondary,
        onSecondary: appColors.onSecondary,
        tertiary: appColors.tertiary,
        onTertiary: appColors.onTertiary,
        error: baseColorScheme.error,
        onError: baseColorScheme.onError,
        background: appColors.background,
        onBackground: appColors.onBackground,
        surface: appColors.surface,
        onSurface: appColors.onSurface);
  }
}

extension AppThemeExtension on ThemeData {
  AppColorsExtension get colorSchemeExtended =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColorSchemeExtended;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
