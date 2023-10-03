import 'package:auto_music_info/core/common/styles/app_global_styles.dart';
import 'package:auto_music_info/core/config/color_scheme/app_pallet.dart';
import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:auto_music_info/module/common/widgets/page_switcher_button.dart';
import 'package:flutter/material.dart';

class SearchSessionPageSwitcher extends StatefulWidget {
  const SearchSessionPageSwitcher({
    Key? key,
    required this.searchSession,
    required this.onPreviousPagePressed,
    required this.onNextPagePressed,
    required this.activePageNotifier,
    this.colorSet,
  }) : super(key: key);

  final SearchSession searchSession;
  final Function onPreviousPagePressed;
  final Function onNextPagePressed;
  final ColorSet? colorSet;
  final ValueNotifier<int> activePageNotifier;

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

  bool _determinePreviousPageButtonEnabled() {
    return searchSession.activePhase.index > 0;
  }

  bool _determineNextPageButtonEnabled() {
    return searchSession.activePhase.index < searchSession.bestPhase.index;
  }

  @override
  State<StatefulWidget> createState() => _SearchSessionPageSwitcherState();
}

class _SearchSessionPageSwitcherState extends State<SearchSessionPageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.appGlobalStyles.sidebarItemHeight,
        color: widget._determineBackgroundColor(context),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // Back button
          Container(
            padding: EdgeInsets.only(
                left:
                    context.appGlobalStyles.pageSwitcherButtonSpacingFromEdges),
            child: PageSwitcherButton(
              icon: Icons.arrow_back,
              onPressed: widget.onPreviousPagePressed,
              determineButtonEnabled:
                  widget._determinePreviousPageButtonEnabled,
            ),
          ),
          Tooltip(
              message: 'Active phase: ${widget.searchSession.activePhase}',
              child: Text(
                widget.searchSession.phaseKeywordInfo.query == ''
                    ? 'New Session'
                    : widget.searchSession.phaseKeywordInfo.query,
                style: TextStyle(
                    fontSize:
                        context.appGlobalStyles.pageSwitcherMainTitleFontSize,
                    color: widget._determineForegroundColor(context)),
              )),
          Container(
            padding: EdgeInsets.only(
                right:
                    context.appGlobalStyles.pageSwitcherButtonSpacingFromEdges),
            child: PageSwitcherButton(
              icon: Icons.arrow_forward,
              onPressed: widget.onNextPagePressed,
              determineButtonEnabled: widget._determineNextPageButtonEnabled,
              buttonIconSize:
                  context.appGlobalStyles.pageSwitcherButtonIconSize,
            ),
          ),
        ]));
  }
}
