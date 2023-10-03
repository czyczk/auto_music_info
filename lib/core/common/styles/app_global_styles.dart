import 'package:auto_music_info/module/search_session_carousel/widgets/screens/search_session_carousel.dart';
import 'package:auto_music_info/module/sidebar/widgets/sidebar_item.dart';
import 'package:flutter/widgets.dart';

abstract class AppGlobalStyles {
  /*
   * Sidebar and outer container of main content.
   */

  /// The width of the sidebar.
  double get sidebarWidth;

  /// The height of the [SidebarItem].
  /// Also the height of the title bar of the keyword page of [SearchSessionCarousel].
  double get sidebarItemHeight;

  /// The distance of the page switcher button from the edges.
  double get pageSwitcherButtonSpacingFromEdges;

  /// The size of the page switcher button icon.
  double get pageSwitcherButtonIconSize;

  /// The font size of the main title of the page switcher.
  double get pageSwitcherMainTitleFontSize;

  /// The font size of the sub title of the page switcher.
  double get pageSwitcherSubTitleFontSize;
}

class _AppGlobalStylesImpl implements AppGlobalStyles {
  @override
  double sidebarWidth = 200;

  @override
  double sidebarItemHeight = 60;

  @override
  double pageSwitcherButtonSpacingFromEdges = 4;

  @override
  double pageSwitcherButtonIconSize = 24;

  @override
  double pageSwitcherMainTitleFontSize = 16;

  @override
  double pageSwitcherSubTitleFontSize = 12;
}

extension GlobalStyleGetter on BuildContext {
  AppGlobalStyles get appGlobalStyles => _AppGlobalStylesImpl();
}
