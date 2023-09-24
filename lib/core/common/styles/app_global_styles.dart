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
}

class _AppGlobalStylesImpl implements AppGlobalStyles {
  @override
  double sidebarWidth = 200;

  @override
  double sidebarItemHeight = 60;
}

extension GlobalStyleGetter on BuildContext {
  AppGlobalStyles get appGlobalStyles => _AppGlobalStylesImpl();
}
