import 'package:auto_music_info/core/config/color_scheme/app_colors_extension.dart';
import 'package:auto_music_info/core/config/color_scheme/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /*
   * Light theme
   */

  static final light = ThemeData.light().copyWith(
    extensions: [_lightAppColorSchemeExtended],
  );

  static final _lightAppColorSchemeExtended = AppColorsExtension(
    // Primary: Dark gray blue
    primary: AppPalette.darkGrayBlue.surface,
    primaryHover: AppPalette.darkGrayBlue.surfaceHover,
    primaryActive: AppPalette.darkGrayBlue.surfaceActive,
    primaryDisabled: AppPalette.darkGrayBlue.surfaceDisabled,
    onPrimary: AppPalette.darkGrayBlue.foreground,
    onPrimaryHover: AppPalette.darkGrayBlue.foregroundHover,
    onPrimaryActive: AppPalette.darkGrayBlue.foregroundActive,
    onPrimaryDisabled: AppPalette.darkGrayBlue.foregroundDisabled,
    // Secondary: Dark gray green
    secondary: AppPalette.darkGrayGreen.surface,
    secondaryHover: AppPalette.darkGrayGreen.surfaceHover,
    secondaryActive: AppPalette.darkGrayGreen.surfaceActive,
    secondaryDisabled: AppPalette.darkGrayGreen.surfaceDisabled,
    onSecondary: AppPalette.darkGrayGreen.foreground,
    onSecondaryHover: AppPalette.darkGrayGreen.foregroundHover,
    onSecondaryActive: AppPalette.darkGrayGreen.foregroundActive,
    onSecondaryDisabled: AppPalette.darkGrayGreen.foregroundDisabled,
    // Tertiary: Moderate vivid orange
    tertiary: AppPalette.moderateVividOrange.surface,
    tertiaryHover: AppPalette.moderateVividOrange.surfaceHover,
    tertiaryActive: AppPalette.moderateVividOrange.surfaceActive,
    tertiaryDisabled: AppPalette.moderateVividOrange.surfaceDisabled,
    onTertiary: AppPalette.moderateVividOrange.foreground,
    onTertiaryHover: AppPalette.moderateVividOrange.foregroundHover,
    onTertiaryActive: AppPalette.moderateVividOrange.foregroundActive,
    onTertiaryDisabled: AppPalette.moderateVividOrange.foregroundDisabled,
    // Quaternary: Light gray
    quaternary: AppPalette.coolGray.surface,
    quaternaryHover: AppPalette.coolGray.surfaceHover,
    quaternaryActive: AppPalette.coolGray.surfaceActive,
    quaternaryDisabled: AppPalette.coolGray.surfaceDisabled,
    onQuaternary: AppPalette.coolGray.foreground,
    onQuaternaryHover: AppPalette.coolGray.foregroundHover,
    onQuaternaryActive: AppPalette.coolGray.foregroundActive,
    onQuaternaryDisabled: AppPalette.coolGray.foregroundDisabled,
    // Other
    surface: AppPalette.coolGray.surface,
    onSurface: AppPalette.coolGray.foreground,
  );

  static final lightColorScheme = _getColorSchemeBasedOnSeed(
    Colors.indigo,
    _lightAppColorSchemeExtended,
  );

  static ColorScheme _getColorSchemeBasedOnSeed(
    Color seedColor,
    AppColorsExtension appColors,
  ) {
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
      surface: appColors.surface,
      onSurface: appColors.onSurface,
    );
  }
}

extension AppThemeExtension on ThemeData {
  AppColorsExtension get colorSchemeExtended =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColorSchemeExtended;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
