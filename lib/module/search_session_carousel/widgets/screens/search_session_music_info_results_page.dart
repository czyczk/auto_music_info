import 'package:auto_music_info/core/common/models/wrapped_data.dart';
import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/core/providers/ami_service/info_extractor_service.dart';
import 'package:auto_music_info/core/providers/ami_service/models/failed_music_info_result_exception.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_source_enum.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_with_request.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_source_enum.dart';
import 'package:auto_music_info/module/common/widgets/ami_text_style.dart';
import 'package:auto_music_info/module/common/widgets/dash_divider.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_clickable_title.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_clickable_url_subtitle.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_copy_button.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_music_info_table.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_source_text.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/screens/html_preview_page.dart';
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
    final percentageStringWithoutTrailingZeroes = percentageString.replaceAll(
      RegExp(r'0*$'),
      '',
    );
    final percentageStringWithoutTrailingDecimalPoint =
        percentageStringWithoutTrailingZeroes.replaceAll(RegExp(r'\.$'), '');
    return percentageStringWithoutTrailingDecimalPoint;
  }

  Icon _determineSourceIcon(WrappedData<MusicInfoWithRequest> musicInfo) {
    final size = 16.0;
    final IconData iconData;
    Color? color;
    if (!musicInfo.hasData) {
      iconData = Icons.error;
      color = Colors.redAccent;
    } else {
      switch (musicInfo.data!.source) {
        case MusicInfoSourceEnum.ai:
          iconData = Icons.auto_awesome;
        case MusicInfoSourceEnum.ruleBased:
          iconData = Icons.rule;
      }
    }

    return Icon(iconData, size: size, color: color);
  }

  TextSpan _determineSourceTooltipDescription(
    WrappedData<MusicInfoWithRequest> musicInfo,
  ) {
    if (!musicInfo.hasData) {
      return TextSpan(text: 'Error');
    }

    // Minimum display text.
    var result = TextSpan(
      text: '',
      children: [
        TextSpan(
          text: musicInfo.data!.source.displayText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );

    if (musicInfo.data!.tools.isNotEmpty) {
      // + optional tools.
      result.children!.addAll([
        TextSpan(text: '\n\n'),
        TextSpan(
          text: 'Tools: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // Expand `tools`. Each line is prepended with a bullet ●.
        TextSpan(text: musicInfo.data!.tools.map((tool) => '\n● $tool').join()),
      ]);
    }

    if (musicInfo.data!.source == MusicInfoSourceEnum.ai &&
        musicInfo.data!.think != null) {
      // + optional ToC.
      result.children!.addAll([
        TextSpan(text: '\n\n'),
        TextSpan(
          text: 'ToC: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: musicInfo.data!.think!),
      ]);
    }

    return result;
  }
}

class _SearchSessionMusicInfoResultsPageState
    extends State<SearchSessionMusicInfoResultsPage> {
  // Debounce
  bool isDebouncing = false;

  void _fetchInfoForSearchResultEntry(
    SearchSourceEnum source,
    int index,
    String url,
    String query,
    InfoExtractorService infoExtractorService,
  ) async {
    try {
      final musicInfo = await infoExtractorService.extractInfo(url, query);
      setState(() {
        widget.searchSession.phaseMusicInfoResultsInfo.fillSuccessfulResult(
          source,
          index,
          musicInfo,
        );
      });
    } on Exception catch (e) {
      setState(() {
        widget.searchSession.phaseMusicInfoResultsInfo.fillFailedResult(
          source,
          index,
          url,
          e,
        );
      });
    }
  }

  Widget _optionalRetryButton(
    WrappedData<MusicInfoWithRequest> musicInfo,
    InfoExtractorService infoExtractorService,
  ) {
    if (musicInfo.hasData || musicInfo.exception == null) {
      return const SizedBox.shrink();
    }

    var exception = musicInfo.exception! as FailedMusicInfoResultException;

    return RawMaterialButton(
      onPressed: () {
        // Debounce
        if (isDebouncing) {
          return;
        }

        try {
          setState(() {
            isDebouncing = true;

            // Mark the result info as not completed and failure count -1.
            widget.searchSession.phaseMusicInfoResultsInfo.revokeFailureCount();

            var query = widget.searchSession.phaseKeywordInfo.query;
            var source = exception.searchSource;
            var index = exception.index;
            var url = exception.url;
            _fetchInfoForSearchResultEntry(
              source,
              index,
              url,
              query,
              infoExtractorService,
            );
          });
        } finally {
          setState(() {
            isDebouncing = false;
          });
        }
      },
      padding: const EdgeInsets.all(6),
      // Make the button compact (remove additional paddings)
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: const Icon(Icons.refresh, size: 16),
    );
  }

  Widget _optionalDebugButton(
    BuildContext context,
    WrappedData<MusicInfoWithRequest> musicInfo,
  ) {
    if (!musicInfo.hasData ||
        (musicInfo.data!.convertedRequest?.structuredDoc == null &&
            musicInfo.data!.request.structuredDoc == null)) {
      return const SizedBox.shrink();
    }

    // It's checked if it enters here.
    var htmlDoc =
        musicInfo.data!.convertedRequest?.structuredDoc! ??
        musicInfo.data!.request.structuredDoc!;

    return Tooltip(
      preferBelow: false,
      message: 'Click to view extracted page',
      child: RawMaterialButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HtmlPreviewPage(htmlDoc: htmlDoc);
              },
            ),
          );
        },
        padding: const EdgeInsets.all(6),
        // Make the button compact (remove additional paddings)
        constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: const Icon(Icons.bug_report_outlined, size: 16),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.searchSession.phaseMusicInfoResultsInfo.isCompleted) {
      return;
    }

    final query = widget.searchSession.phaseKeywordInfo.query;
    // Delay the execution using the provider until after the first frame (when the providers are ready in the context).
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final infoExtractorService = Provider.of<InfoExtractorService>(
        context,
        listen: false,
      );
      for (final mapEntry
          in widget
              .searchSession
              .phaseMusicInfoResultsInfo
              .selectedEntries
              .entries) {
        var source = mapEntry.key;
        var urls = mapEntry.value.map((e) => e.url).toList();
        final futures = urls.indexed.map((indexedEntry) async {
          final index = indexedEntry.$1;
          final url = indexedEntry.$2;
          return () async {
            _fetchInfoForSearchResultEntry(
              source,
              index,
              url,
              query,
              infoExtractorService,
            );
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
    final infoExtractorService = Provider.of<InfoExtractorService>(context);

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
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: widget
                        .searchSession
                        .phaseMusicInfoResultsInfo
                        .successCount,
                    child: Container(
                      height: 10,
                      color: context.theme.colorSchemeExtended.primary,
                    ),
                  ),
                  Expanded(
                    flex: widget
                        .searchSession
                        .phaseMusicInfoResultsInfo
                        .failureCount,
                    child: Container(height: 10, color: Colors.redAccent),
                  ),
                  Expanded(
                    flex: pendingCount,
                    child: Container(height: 8, color: Colors.grey),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: AmiTextStyle(child: Text('Fetching info...')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: AmiTextStyle(
                  child: Text(
                    '${successCount + failureCount} / $totalCount (${widget._formatPercentage(successCount, failureCount, totalCount)}%)',
                  ),
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
                      .searchSession
                      .phaseMusicInfoResultsInfo
                      .musicInfoMap
                      .keys
                      .where((searchSource) {
                        final musicInfoList = widget
                            .searchSession
                            .phaseMusicInfoResultsInfo
                            .selectedEntries[searchSource];
                        return musicInfoList != null &&
                            musicInfoList.isNotEmpty;
                      })
                      .map((searchSource) {
                        List<WrappedData<MusicInfoWithRequest>?> musicInfoList =
                            widget
                                .searchSession
                                .phaseMusicInfoResultsInfo
                                .musicInfoMap[searchSource]!;
                        return SizedBox(
                          width: 400,
                          height: 560,
                          child: Card(
                            color: Colors.white.withValues(alpha: 0.92),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Search source
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    12,
                                    12,
                                    12,
                                    6,
                                  ),
                                  child: SearchSessionResultPageSourceText(
                                    sourceDisplayText: searchSource.displayText,
                                  ),
                                ),
                                const Divider(color: Colors.grey),
                                Expanded(
                                  child: ListView.separated(
                                    itemCount: musicInfoList.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            child: DashDivider(
                                              height: 1,
                                              color: Colors.grey.withValues(
                                                alpha: 0.3,
                                              ),
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
                                        // Search result entry title + debug icon + info source icon
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
                                                    title:
                                                        searchResultEntry.title,
                                                  ),
                                            ),
                                            _optionalRetryButton(
                                              musicInfo,
                                              infoExtractorService,
                                            ),
                                            _optionalDebugButton(
                                              context,
                                              musicInfo,
                                            ),
                                            SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Tooltip(
                                                preferBelow: false,
                                                richMessage: widget
                                                    ._determineSourceTooltipDescription(
                                                      musicInfo,
                                                    ),
                                                child: Container(
                                                  margin: EdgeInsets.all(6),
                                                  child: widget
                                                      ._determineSourceIcon(
                                                        musicInfo,
                                                      ),
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
                                            Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                      SearchSessionResultPageClickableUrlSubtitle(
                                                        url: searchResultEntry
                                                            .url,
                                                      ),
                                                ),
                                                SearchSessionResultPageCopyButton(
                                                  textToCopy:
                                                      searchResultEntry.url,
                                                ),
                                              ],
                                            ),
                                            // Music info
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                    0,
                                                    8,
                                                    0,
                                                    0,
                                                  ),
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
                      })
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
