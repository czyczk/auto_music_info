import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/module/common/widgets/ami_text_style.dart';
import 'package:flutter/material.dart';

class SearchSessionResultPageSourceText extends StatelessWidget {
  const SearchSessionResultPageSourceText({
    Key? key,
    required this.sourceDisplayText,
  }) : super(key: key);

  final String sourceDisplayText;

  @override
  Widget build(BuildContext context) {
    return AmiTextStyle(
      child: Text(
        sourceDisplayText,
        style: TextStyle(
          color: context.theme.colorSchemeExtended.onBackground,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
