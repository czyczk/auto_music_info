import 'package:auto_music_info/core/common/utils/id_util.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_page_switcher.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/screens/search_session_keyword_page.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/screens/search_session_music_info_results_page.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/screens/search_session_search_results_page.dart';
import 'package:flutter/material.dart';

class SearchSessionCarousel extends StatefulWidget {
  SearchSessionCarousel.ofNewSession({Key? key}) : super(key: key) {
    searchSession = SearchSession(sessionId: generateLongId());
  }

  SearchSessionCarousel.ofExistingSession(
      {Key? key, required this.searchSession});

  late final SearchSession searchSession;

  @override
  State<StatefulWidget> createState() => _SearchSessionCarouselState();
}

class _SearchSessionCarouselState extends State<SearchSessionCarousel>
    with AutomaticKeepAliveClientMixin<SearchSessionCarousel> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _activePageNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _pageController.dispose();
    _activePageNotifier.dispose();
    super.dispose();
  }

  Function getOnPreviousPagePressed() {
    return () {
      if (_pageController.page == 0) {
        return;
      }

      widget.searchSession.activePhase =
          SearchSessionPhaseEnum.values[_pageController.page!.round() - 1];
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutQuint);
    };
  }

  Function getOnNextPagePressed() {
    return () {
      if (_pageController.page == SearchSessionPhaseEnum.values.length - 1) {
        return;
      }

      widget.searchSession.activePhase =
          SearchSessionPhaseEnum.values[_pageController.page!.round() + 1];
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutQuint);
    };
  }

  Function getUpdateActivePageFunc() {
    return (int newPage) {
      final currentActivePage = _pageController.page?.round();
      if (currentActivePage != null && newPage == currentActivePage) {
        return;
      }

      _pageController.animateToPage(newPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutQuint);
    };
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final updateActivePageFunc = getUpdateActivePageFunc();
    return ValueListenableBuilder<int>(
      valueListenable: _activePageNotifier,
      builder: (BuildContext context, int activePage, Widget? child) {
        return Column(children: [
          SizedBox(
            width: double.infinity,
            child: SearchSessionPageSwitcher(
              searchSession: widget.searchSession,
              onPreviousPagePressed: getOnPreviousPagePressed(),
              onNextPagePressed: getOnNextPagePressed(),
              activePageNotifier: _activePageNotifier,
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int newPage) {
                _activePageNotifier.value = newPage;
              },
              children: [
                SearchSessionKeywordPage(
                  searchSession: widget.searchSession,
                  updateActivePageFunc: updateActivePageFunc,
                ),
                SearchSessionSearchResultsPage(
                  searchSession: widget.searchSession,
                  updateActivePageFunc: updateActivePageFunc,
                ),
                SearchSessionMusicInfoResultsPage(
                  searchSession: widget.searchSession,
                  updateActivePageFunc: updateActivePageFunc,
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }
}
