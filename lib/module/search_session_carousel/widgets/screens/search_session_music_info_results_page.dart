import 'package:auto_music_info/core/common/models/wrapped_data.dart';
import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/core/providers/ami_service/info_extractor_service.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_source_enum.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_with_request.dart';
import 'package:auto_music_info/module/common/widgets/ami_text_style.dart';
import 'package:auto_music_info/module/common/widgets/dash_divider.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_clickable_title.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_clickable_url_subtitle.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_copy_button.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_music_info_table.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_source_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchSessionMusicInfoResultsPage extends StatefulWidget {
  final SearchSession searchSession;
  final Function updateActivePageFunc;

  const SearchSessionMusicInfoResultsPage({
    super.key,
    required this.searchSession,
    required this.updateActivePageFunc,
  });

  @override
  State<SearchSessionMusicInfoResultsPage> createState() =>
      _SearchSessionMusicInfoResultsPageState();

  String _formatPercentage(int successCount, int failureCount, int totalCount) {
    // Ensure a precision of two digits after the decimal point at most.
    final percentage = (successCount + failureCount) / totalCount * 100;
    final percentageString = percentage.toStringAsFixed(2);
    final percentageStringWithoutTrailingZeroes =
        percentageString.replaceAll(RegExp(r'0*$'), '');
    final percentageStringWithoutTrailingDecimalPoint =
        percentageStringWithoutTrailingZeroes.replaceAll(RegExp(r'\.$'), '');
    return percentageStringWithoutTrailingDecimalPoint;
  }

  IconData _determineSourceIcon(WrappedData<MusicInfoWithRequest> musicInfo) {
    if (!musicInfo.hasData) {
      return Icons.error;
    }

    switch (musicInfo.data!.source) {
      case MusicInfoSourceEnum.ai:
        return Icons.auto_awesome;
      case MusicInfoSourceEnum.ruleBased:
        return Icons.rule;
    }
  }

  String _determineSourceTooltipDescription(
      WrappedData<MusicInfoWithRequest> musicInfo) {
    if (!musicInfo.hasData) {
      return 'Error';
    }

    return musicInfo.data!.source.displayText;
  }
}

class _SearchSessionMusicInfoResultsPageState
    extends State<SearchSessionMusicInfoResultsPage> {
  // Debounce
  bool isDebouncing = false;

  @override
  void initState() {
    super.initState();

    if (widget.searchSession.phaseMusicInfoResultsInfo.isCompleted) {
      return;
    }

    final query = widget.searchSession.phaseKeywordInfo.query;
    // Delay the execution using the provider until after the first frame (when the providers are ready in the context).
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final infoExtractorService =
          Provider.of<InfoExtractorService>(context, listen: false);
      for (final mapEntry in widget
          .searchSession.phaseMusicInfoResultsInfo.selectedEntries.entries) {
        final source = mapEntry.key;
        final futures = mapEntry.value.indexed.map((indexedEntry) async {
          final index = indexedEntry.$1;
          final selectedEntry = indexedEntry.$2;
          return () async {
            try {
              final musicInfo = await infoExtractorService.extractInfo(
                  selectedEntry.url, query);
              setState(() {
                widget.searchSession.phaseMusicInfoResultsInfo
                    .fillSuccessfulResult(source, index, musicInfo);
              });
            } on Exception catch (e) {
              setState(() {
                widget.searchSession.phaseMusicInfoResultsInfo
                    .fillFailedResult(source, index, e);
              });
            }
          };
        }).toList();
        final results = await Future.wait(futures);
        for (var result in results) {
          result();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.searchSession.phaseMusicInfoResultsInfo.isCompleted) {
      // Return a loading screen containing a progress bar.
      // The bar takes min(50%, 300px) of the screen width.
      // The sections from left to right indicate the count of completed successfully (in blue),
      // the count of failures (in red) and the count of pending (in grey).
      final successCount =
          widget.searchSession.phaseMusicInfoResultsInfo.successCount;
      final failureCount =
          widget.searchSession.phaseMusicInfoResultsInfo.failureCount;
      final totalCount =
          widget.searchSession.phaseMusicInfoResultsInfo.totalCount;
      final pendingCount = totalCount - successCount - failureCount;
      return Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 300,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: widget
                        .searchSession.phaseMusicInfoResultsInfo.successCount,
                    child: Container(
                      height: 10,
                      color: context.theme.colorSchemeExtended.primary,
                    ),
                  ),
                  Expanded(
                    flex: widget
                        .searchSession.phaseMusicInfoResultsInfo.failureCount,
                    child: Container(
                      height: 10,
                      color: Colors.redAccent,
                    ),
                  ),
                  Expanded(
                    flex: pendingCount,
                    child: Container(
                      height: 8,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: AmiTextStyle(
                  child: Text('Fetching info...'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: AmiTextStyle(
                  child: Text(
                      '${successCount + failureCount} / $totalCount (${widget._formatPercentage(successCount, failureCount, totalCount)}%)'),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: widget
                      .searchSession.phaseMusicInfoResultsInfo.musicInfoMap.keys
                      .where((searchSource) {
                    final musicInfoList = widget
                        .searchSession
                        .phaseMusicInfoResultsInfo
                        .selectedEntries[searchSource];
                    return musicInfoList != null && musicInfoList.isNotEmpty;
                  }).map((searchSource) {
                    List<WrappedData<MusicInfoWithRequest>?> musicInfoList =
                        widget.searchSession.phaseMusicInfoResultsInfo
                            .musicInfoMap[searchSource]!;
                    return SizedBox(
                      width: 400,
                      height: 560,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Search source
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                              child: SearchSessionResultPageSourceText(
                                sourceDisplayText: searchSource.displayText,
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemCount: musicInfoList.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: DashDivider(
                                      height: 1,
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                  );
                                },
                                itemBuilder: (context, index) {
                                  final searchResultEntry = widget
                                      .searchSession
                                      .phaseMusicInfoResultsInfo
                                      .selectedEntries[searchSource]![index];
                                  final musicInfo = musicInfoList[index]!;
                                  return ListTile(
                                    // Search result entry title + info source icon
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
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: Tooltip(
                                            preferBelow: false,
                                            message: widget
                                                ._determineSourceTooltipDescription(
                                                    musicInfo),
                                            child: Icon(
                                              widget._determineSourceIcon(
                                                  musicInfo),
                                              size: 12,
                                            ),
                                          ),
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
                                        // Music info
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 8, 0, 0),
                                          child:
                                              SearchSessionResultPageMusicInfoTable(
                                            musicInfo: musicInfo,
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
          ],
        ),
      );
    }
  }
}
