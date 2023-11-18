import 'package:auto_music_info/core/common/utils/font_util.dart';
import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/core/providers/ami_service/models/text_language_enum.dart';
import 'package:flutter/material.dart';

class AmiTextStyle extends StatelessWidget {
  final Widget child;
  final TextLanguageEnum? textLanguage;

  const AmiTextStyle({super.key, required this.child, this.textLanguage});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).copyWith(
      textSelectionTheme: TextSelectionThemeData(
        selectionColor:
            context.theme.colorSchemeExtended.tertiary.withOpacity(0.3),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: determineFontFamily(),
            fontFamilyFallback: determineFontFamilyFallback(textLanguage),
          ),
    );

    return DefaultTextStyle.merge(
        style: determineTextStyle(textLanguage),
        child: Theme(
          data: themeData,
          child: child,
        ));
  }
}
