import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.primaryHover,
    required this.primaryActive,
    required this.primaryDisabled,
    required this.onPrimary,
    required this.onPrimaryHover,
    required this.onPrimaryActive,
    required this.onPrimaryDisabled,
    required this.secondary,
    required this.secondaryHover,
    required this.secondaryActive,
    required this.secondaryDisabled,
    required this.onSecondary,
    required this.onSecondaryHover,
    required this.onSecondaryActive,
    required this.onSecondaryDisabled,
    required this.tertiary,
    required this.tertiaryHover,
    required this.tertiaryActive,
    required this.tertiaryDisabled,
    required this.onTertiary,
    required this.onTertiaryHover,
    required this.onTertiaryActive,
    required this.onTertiaryDisabled,
    required this.quaternary,
    required this.quaternaryHover,
    required this.quaternaryActive,
    required this.quaternaryDisabled,
    required this.onQuaternary,
    required this.onQuaternaryHover,
    required this.onQuaternaryActive,
    required this.onQuaternaryDisabled,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
  });

  final Color primary;
  final Color primaryHover;
  final Color primaryActive;
  final Color primaryDisabled;
  final Color onPrimary;
  final Color onPrimaryHover;
  final Color onPrimaryActive;
  final Color onPrimaryDisabled;
  final Color secondary;
  final Color secondaryHover;
  final Color secondaryActive;
  final Color secondaryDisabled;
  final Color onSecondary;
  final Color onSecondaryHover;
  final Color onSecondaryActive;
  final Color onSecondaryDisabled;
  final Color tertiary;
  final Color tertiaryHover;
  final Color tertiaryActive;
  final Color tertiaryDisabled;
  final Color onTertiary;
  final Color onTertiaryHover;
  final Color onTertiaryActive;
  final Color onTertiaryDisabled;
  final Color quaternary;
  final Color quaternaryHover;
  final Color quaternaryActive;
  final Color quaternaryDisabled;
  final Color onQuaternary;
  final Color onQuaternaryHover;
  final Color onQuaternaryActive;
  final Color onQuaternaryDisabled;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? primaryHover,
    Color? primaryActive,
    Color? primaryDisabled,
    Color? onPrimary,
    Color? onPrimaryHover,
    Color? onPrimaryActive,
    Color? onPrimaryDisabled,
    Color? secondary,
    Color? secondaryHover,
    Color? secondaryActive,
    Color? secondaryDisabled,
    Color? onSecondary,
    Color? onSecondaryHover,
    Color? onSecondaryActive,
    Color? onSecondaryDisabled,
    Color? tertiary,
    Color? tertiaryHover,
    Color? tertiaryActive,
    Color? tertiaryDisabled,
    Color? onTertiary,
    Color? onTertiaryHover,
    Color? onTertiaryActive,
    Color? onTertiaryDisabled,
    Color? quaternary,
    Color? quaternaryHover,
    Color? quaternaryActive,
    Color? quaternaryDisabled,
    Color? onQuaternary,
    Color? onQuaternaryHover,
    Color? onQuaternaryActive,
    Color? onQuaternaryDisabled,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryActive: primaryActive ?? this.primaryActive,
      primaryDisabled: primaryDisabled ?? this.primaryDisabled,
      onPrimary: onPrimary ?? this.onPrimary,
      onPrimaryHover: onPrimaryHover ?? this.onPrimaryHover,
      onPrimaryActive: onPrimaryActive ?? this.onPrimaryActive,
      onPrimaryDisabled: onPrimaryDisabled ?? this.onPrimaryDisabled,
      secondary: secondary ?? this.secondary,
      secondaryHover: secondaryHover ?? this.secondaryHover,
      secondaryActive: secondaryActive ?? this.secondaryActive,
      secondaryDisabled: secondaryDisabled ?? this.secondaryDisabled,
      onSecondary: onSecondary ?? this.onSecondary,
      onSecondaryHover: onSecondaryHover ?? this.onSecondaryHover,
      onSecondaryActive: onSecondaryActive ?? this.onSecondaryActive,
      onSecondaryDisabled: onSecondaryDisabled ?? this.onSecondaryDisabled,
      tertiary: tertiary ?? this.tertiary,
      tertiaryHover: tertiaryHover ?? this.tertiaryHover,
      tertiaryActive: tertiaryActive ?? this.tertiaryActive,
      tertiaryDisabled: tertiaryDisabled ?? this.tertiaryDisabled,
      onTertiary: onTertiary ?? this.onTertiary,
      onTertiaryHover: onTertiaryHover ?? this.onTertiaryHover,
      onTertiaryActive: onTertiaryActive ?? this.onTertiaryActive,
      onTertiaryDisabled: onTertiaryDisabled ?? this.onTertiaryDisabled,
      quaternary: quaternary ?? this.quaternary,
      quaternaryHover: quaternaryHover ?? this.quaternaryHover,
      quaternaryActive: quaternaryActive ?? this.quaternaryActive,
      quaternaryDisabled: quaternaryDisabled ?? this.quaternaryDisabled,
      onQuaternary: onQuaternary ?? this.onQuaternary,
      onQuaternaryHover: onQuaternaryHover ?? this.onQuaternaryHover,
      onQuaternaryActive: onQuaternaryActive ?? this.onQuaternaryActive,
      onQuaternaryDisabled: onQuaternaryDisabled ?? this.onQuaternaryDisabled,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
      covariant ThemeExtension<AppColorsExtension>? other, double t) {
    if (other == null || other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      primaryActive: Color.lerp(primaryActive, other.primaryActive, t)!,
      primaryDisabled: Color.lerp(primaryDisabled, other.primaryDisabled, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onPrimaryHover: Color.lerp(onPrimaryHover, other.onPrimaryHover, t)!,
      onPrimaryActive: Color.lerp(onPrimaryActive, other.onPrimaryActive, t)!,
      onPrimaryDisabled:
          Color.lerp(onPrimaryDisabled, other.onPrimaryDisabled, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryHover: Color.lerp(secondaryHover, other.secondaryHover, t)!,
      secondaryActive: Color.lerp(secondaryActive, other.secondaryActive, t)!,
      secondaryDisabled:
          Color.lerp(secondaryDisabled, other.secondaryDisabled, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      onSecondaryHover:
          Color.lerp(onSecondaryHover, other.onSecondaryHover, t)!,
      onSecondaryActive:
          Color.lerp(onSecondaryActive, other.onSecondaryActive, t)!,
      onSecondaryDisabled:
          Color.lerp(onSecondaryDisabled, other.onSecondaryDisabled, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      tertiaryHover: Color.lerp(tertiaryHover, other.tertiaryHover, t)!,
      tertiaryActive: Color.lerp(tertiaryActive, other.tertiaryActive, t)!,
      tertiaryDisabled:
          Color.lerp(tertiaryDisabled, other.tertiaryDisabled, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      onTertiaryHover: Color.lerp(onTertiaryHover, other.onTertiaryHover, t)!,
      onTertiaryActive:
          Color.lerp(onTertiaryActive, other.onTertiaryActive, t)!,
      onTertiaryDisabled:
          Color.lerp(onTertiaryDisabled, other.onTertiaryDisabled, t)!,
      quaternary: Color.lerp(quaternary, other.quaternary, t)!,
      quaternaryHover: Color.lerp(quaternaryHover, other.quaternaryHover, t)!,
      quaternaryActive:
          Color.lerp(quaternaryActive, other.quaternaryActive, t)!,
      quaternaryDisabled:
          Color.lerp(quaternaryDisabled, other.quaternaryDisabled, t)!,
      onQuaternary: Color.lerp(onQuaternary, other.onQuaternary, t)!,
      onQuaternaryHover:
          Color.lerp(onQuaternaryHover, other.onQuaternaryHover, t)!,
      onQuaternaryActive:
          Color.lerp(onQuaternaryActive, other.onQuaternaryActive, t)!,
      onQuaternaryDisabled:
          Color.lerp(onQuaternaryDisabled, other.onQuaternaryDisabled, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
    );
  }
}
