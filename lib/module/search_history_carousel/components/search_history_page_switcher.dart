import 'package:auto_music_info/core/common/styles/app_global_styles.dart';
import 'package:auto_music_info/core/config/color_scheme/app_pallet.dart';
import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/module/common/widgets/page_switcher_button.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:flutter/material.dart';

class SearchHistoryPageSwitcher extends StatelessWidget {
  final SearchSession? searchSession;
  final GlobalKey<NavigatorState> navigatorKey;
  final Function onBackButtonPressed;
  final ColorSet? colorSet;

  const SearchHistoryPageSwitcher({
    Key? key,
    required this.searchSession,
    required this.navigatorKey,
    required this.onBackButtonPressed,
    this.colorSet,
  }) : super(key: key);

  Color _determineBackgroundColor(BuildContext context) {
    if (colorSet == null) {
      return context.theme.colorSchemeExtended.primary;
    } else {
      return colorSet!.background;
    }
  }

  Color _determineForegroundColor(BuildContext context) {
    if (colorSet == null) {
      return context.theme.colorSchemeExtended.onPrimary;
    } else {
      return colorSet!.foreground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.appGlobalStyles.sidebarItemHeight,
      color: _determineBackgroundColor(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child:
                // Back button
                Container(
              padding: EdgeInsets.only(
                left:
                    context.appGlobalStyles.pageSwitcherButtonSpacingFromEdges,
              ),
              child: PageSwitcherButton(
                icon: Icons.arrow_back,
                onPressed: onBackButtonPressed,
                determineButtonEnabled: () => true,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Tooltip(
              message: searchSession?.phaseKeywordInfo.query ?? 'History',
              child: Text(
                searchSession?.phaseKeywordInfo.query ?? 'History',
                style: TextStyle(
                  fontSize:
                      context.appGlobalStyles.pageSwitcherMainTitleFontSize,
                  color: _determineForegroundColor(context),
                ),
              ),
            ),
          ),
        ],
      ),
      // No forward button
    );
  }
}
