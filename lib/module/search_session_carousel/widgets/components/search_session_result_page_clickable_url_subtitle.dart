import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/module/common/widgets/ami_text_style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchSessionResultPageClickableUrlSubtitle extends StatelessWidget {
  final String url;

  const SearchSessionResultPageClickableUrlSubtitle({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: AmiTextStyle(
        // TODO depends on the text language of the session.
        textLanguage: null,
        child: Text(
          url,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: context.theme.colorSchemeExtended.secondary),
        ),
      ),
    );
  }
}
