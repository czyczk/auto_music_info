import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_result_entry.dart';
import 'package:auto_music_info/module/common/widgets/dash_divider.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchSessionResultsPage extends StatelessWidget {
  final SearchSession searchSession;

  const SearchSessionResultsPage({super.key, required this.searchSession});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: searchSession.phaseSearchResultsInfo.searchResultsMap.keys
              .map((searchSource) {
            List<SearchResultEntry> searchResultEntries = searchSession
                .phaseSearchResultsInfo.searchResultsMap[searchSource]!;
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
                      child: Text(
                        searchSource.displayText,
                        style: TextStyle(
                          color: context.theme.colorSchemeExtended.onBackground,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: searchResultEntries.length,
                        separatorBuilder: (BuildContext context, int index) {
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
                            // Search result entry title + copy title button
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () => launchUrl(
                                        Uri.parse(searchResultEntry.url)),
                                    child: Text(searchResultEntry.title,
                                        style: TextStyle(
                                          color: context.theme
                                              .colorSchemeExtended.tertiary,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ),
                                RawMaterialButton(
                                  onPressed: () async => {
                                    await Clipboard.setData(ClipboardData(
                                        text: searchResultEntry.title))
                                  },
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 24,
                                    minHeight: 24,
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  child: const Icon(
                                    Icons.copy,
                                    size: 12,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Search result entry URL + copy URL button
                                Row(children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () => launchUrl(
                                          Uri.parse(searchResultEntry.url)),
                                      child: Text(
                                        searchResultEntry.url,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: context.theme
                                                .colorSchemeExtended.secondary),
                                      ),
                                    ),
                                  ),
                                  RawMaterialButton(
                                    onPressed: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text: searchResultEntry.url));
                                    },
                                    padding: const EdgeInsets.all(8),
                                    constraints: const BoxConstraints(
                                      minWidth: 24,
                                      minHeight: 24,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    child: const Icon(
                                      Icons.copy,
                                      size: 12,
                                    ),
                                  )
                                ]),
                                // Search result entry snippet
                                Theme(
                                  data: ThemeData(
                                      textSelectionTheme:
                                          TextSelectionThemeData(
                                    selectionColor: context
                                        .theme.colorSchemeExtended.tertiary
                                        .withOpacity(0.3),
                                  )),
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
    );
  }
}
