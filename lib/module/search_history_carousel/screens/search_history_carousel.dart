import 'package:auto_music_info/module/search_history_carousel/components/search_history_page_switcher.dart';
import 'package:auto_music_info/module/search_history_carousel/screens/search_history_page.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:flutter/material.dart';

class SearchHistoryCarousel extends StatefulWidget {
  const SearchHistoryCarousel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchHistoryCarouselState();
}

class _SearchHistoryCarouselState extends State<SearchHistoryCarousel> {
  SearchSession? searchSession;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        child: SearchHistoryPageSwitcher(
          searchSession: searchSession,
          navigatorKey: _navigatorKey,
          onBackButtonPressed: () {
            _navigatorKey.currentState!.pop(context);
          },
        ),
      ),
      Expanded(
        child: Navigator(
          key: _navigatorKey,
          onGenerateRoute: (settings) {
            if (settings.name == Navigator.defaultRouteName) {
              return MaterialPageRoute(
                builder: (context) => SearchHistoryPage(
                  navigatorKey: _navigatorKey,
                ),
              );
            }

            return null;
          },
        ),
      ),
    ]);
  }
}
