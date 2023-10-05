import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_results.dart';
import 'package:auto_music_info/core/providers/ami_service/search_service.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SearchSessionKeywordPage extends StatefulWidget {
  SearchSessionKeywordPage({
    Key? key,
    required this.searchSession,
    required this.updateActivePageFunc,
  }) : super(key: key);

  final SearchSession searchSession;

  final Function updateActivePageFunc;

  @override
  State<StatefulWidget> createState() => _SearchSessionKeywordPage();
}

class _SearchSessionKeywordPage extends State<SearchSessionKeywordPage> {
  final keywordTextController = TextEditingController();

  // Debounce
  bool isDebouncing = false;

  Future<void> _submitKeyword(SearchService searchService,
      ScaffoldMessengerState scaffoldMessengerState) async {
    // Debounce
    if (isDebouncing) {
      return;
    }

    setState(() {
      isDebouncing = true;
    });

    final enteredKeyword = keywordTextController.text;
    if (kDebugMode) {
      print('enteredKeyword: $enteredKeyword');
    }

    try {
      SearchResults searchResults =
          await searchService.searchWithKeyword(enteredKeyword);

      setState(() {
        // Push forward after a successful search.
        // Update session info.
        widget.searchSession.phaseKeywordInfo.query = enteredKeyword;
        widget.searchSession.activePhase =
            SearchSessionPhaseEnum.phaseSearchResults;
        widget.searchSession.sessionUpdateTime = DateTime.now();
        // Set the best phase to phaseSearchResults even if there are further phases before.
        // Any further phases will be not accessible.
        widget.searchSession.bestPhase =
            SearchSessionPhaseEnum.phaseSearchResults;
        widget.searchSession.phaseSearchResultsInfo =
            SearchSessionPhaseSearchResultsInfo.ofResults(
                query: searchResults.query,
                correctedQuery: searchResults.correctedQuery,
                searchResultsMap: searchResults.resultMap);
      });
    } catch (e) {
      scaffoldMessengerState.showSnackBar(
        SnackBar(
          content: Text('Failed to search: ${e.toString()}'),
        ),
      );
    } finally {
      setState(() {
        widget.updateActivePageFunc(widget.searchSession.activePhase.index);
        isDebouncing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SearchService searchService = Provider.of<SearchService>(context);
    FocusNode focusNode = FocusNode();

    return Container(
        color: Color.lerp(
            context.theme.colorSchemeExtended.background, Colors.white, 0.42),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.only(bottom: 32),
            child: Image.asset(
              'assets/logos/ami_logo.png',
              width: 450,
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 600),
              child: RawKeyboardListener(
                onKey: (event) => {
                  if (event is RawKeyDownEvent &&
                      event.logicalKey == LogicalKeyboardKey.enter)
                    _submitKeyword(
                      searchService,
                      ScaffoldMessenger.of(context),
                    ),
                },
                focusNode: focusNode,
                child: TextField(
                  controller: keywordTextController,
                  autofocus: true,
                  enabled: !isDebouncing,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            context.theme.colorSchemeExtended.onPrimaryDisabled,
                      ),
                    ),
                    hintText: 'Enter keyword to search',
                    hintStyle: TextStyle(
                      color: context.theme.colorSchemeExtended.onBackground,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 28,
                ),
                onPressed: () => _submitKeyword(
                  searchService,
                  ScaffoldMessenger.of(context),
                ),
              ),
            )
          ]),
          Text(widget.searchSession.activePhase.toString()),
          // A spacer to push the main content up a little.
          const SizedBox(
            height: 64,
          )
        ]));
  }
}
