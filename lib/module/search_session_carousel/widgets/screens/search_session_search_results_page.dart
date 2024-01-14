import 'package:auto_music_info/core/providers/ami_service/models/search_result_entry.dart';
import 'package:auto_music_info/module/common/widgets/ami_text_style.dart';
import 'package:auto_music_info/module/common/widgets/dash_divider.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_result_entry_checkbox.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_clickable_title.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_clickable_url_subtitle.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_copy_button.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_source_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchSessionSearchResultsPage extends StatefulWidget {
  final SearchSession searchSession;
  final Function updateActivePageFunc;

  const SearchSessionSearchResultsPage({
    super.key,
    required this.searchSession,
    required this.updateActivePageFunc,
  });

  @override
  State<SearchSessionSearchResultsPage> createState() =>
      _SearchSessionSearchResultsPageState();
}

class _SearchSessionSearchResultsPageState
    extends State<SearchSessionSearchResultsPage> {
  final keyProceedButton = GlobalKey();
  final keyboardListenerFocusNode = FocusNode();

  // Debounce
  bool isDebouncing = false;

  @override
  void dispose() {
    keyboardListenerFocusNode.dispose();
    super.dispose();
  }

  Future<void> _confirmSelections() async {
    // Debounce
    if (isDebouncing) {
      return;
    }
    setState(() {
      isDebouncing = true;
    });

    try {
      // Filter out the selected entries while preserving the map structure.
      final selectedEntries = widget
          .searchSession.phaseSearchResultsInfo.searchResultsMap
          .map((k, v) {
        return MapEntry(k, v.where((element) => element.isSelected).toList());
      });
      if (kDebugMode) {
        final totalCount = selectedEntries.values
            .map((list) => list.length)
            .reduce((acc, listLength) => acc + listLength);
        print('selectedEntriesCount: $totalCount');
      }

      // Update session info.
      // Set the tasks and proceed to the next phase.
      // Info will be fetched and extracted in the next phase.
      widget.searchSession.phaseMusicInfoResultsInfo =
          SearchSessionPhaseMusicInfoResultsInfo.ofPending(
        query: widget.searchSession.phaseSearchResultsInfo.query,
        correctedQuery:
            widget.searchSession.phaseSearchResultsInfo.correctedQuery,
        selectedEntries: selectedEntries,
      );

      setState(() {
        widget.searchSession.sessionUpdateTime = DateTime.now();
        // Set the best phase to phaseMusicInfoResults even if there are further phases before.
        // Any further phases will be not accessible.
        widget.searchSession.bestPhase =
            SearchSessionPhaseEnum.phaseMusicInfoResults;
        // Push forward.
        widget.searchSession.activePhase =
            SearchSessionPhaseEnum.phaseMusicInfoResults;
        widget.updateActivePageFunc(widget.searchSession.activePhase.index);
      });
    } finally {
      setState(() {
        isDebouncing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  // There's an action button on the right so no padding on the right.
                  padding: const EdgeInsets.fromLTRB(24, 24, 0, 24),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: widget.searchSession.phaseSearchResultsInfo
                        .searchResultsMap.keys
                        .map((searchSource) {
                      List<SearchResultEntry> searchResultEntries = widget
                          .searchSession
                          .phaseSearchResultsInfo
                          .searchResultsMap[searchSource]!;
                      return SizedBox(
                        width: 400,
                        height: 560,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Search source
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 6),
                                child: SearchSessionResultPageSourceText(
                                  sourceDisplayText: searchSource.displayText,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              Expanded(
                                child: ListView.separated(
                                  itemCount: searchResultEntries.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      child: DashDivider(
                                        height: 1,
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    SearchResultEntry searchResultEntry =
                                        searchResultEntries[index];
                                    return ListTile(
                                      // Search result entry title + checkbox
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child:
                                                SearchSessionResultPageClickableTitle(
                                              url: searchResultEntry.url,
                                              title: searchResultEntry.title,
                                            ),
                                          ),
                                          SearchResultEntryCheckbox(
                                            initialValue: false,
                                            onChanged: (bool? val) {
                                              searchResultEntry.isSelected =
                                                  val!;
                                            },
                                          ),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Search result entry URL + copy URL button
                                          Row(children: [
                                            Expanded(
                                              child:
                                                  SearchSessionResultPageClickableUrlSubtitle(
                                                url: searchResultEntry.url,
                                              ),
                                            ),
                                            SearchSessionResultPageCopyButton(
                                                textToCopy:
                                                    searchResultEntry.url),
                                          ]),
                                          // Search result entry snippet
                                          AmiTextStyle(
                                            // TODO depends on the text language of the session.
                                            textLanguage: null,
                                            child: SelectableText(
                                              searchResultEntry.snippet,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                // This is just a placeholder for spacing.
                width: 120,
              ),
            ],
          ),
        ),
        // A space on the right that takes up a width of 30 for the action button.
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 120,
            child: Center(
              child: IconButton(
                key: keyProceedButton,
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 28,
                ),
                onPressed: () => _confirmSelections(),
              ),
            ), // Your button
          ),
        ),
      ],
    );
  }
}
