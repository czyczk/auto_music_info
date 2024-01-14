import 'package:auto_music_info/core/common/models/wrapped_data.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_with_request.dart';
import 'package:auto_music_info/module/common/widgets/ami_text_style.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/components/search_session_result_page_copy_button.dart';
import 'package:flutter/material.dart';

class SearchSessionResultPageMusicInfoTable extends StatelessWidget {
  final WrappedData<MusicInfoWithRequest> musicInfo;

  const SearchSessionResultPageMusicInfoTable({
    super.key,
    required this.musicInfo,
  });

  List<MapEntry<String, String>> _toRowData(MusicInfo musicInfo) {
    final List<MapEntry<String, String>> viewModels = [];
    viewModels.add(MapEntry('Title', musicInfo.title));
    viewModels.add(MapEntry('Artists', musicInfo.artists.join(', ')));
    if (musicInfo.album != null) {
      viewModels.add(MapEntry('Album', musicInfo.album!));
    }
    if (musicInfo.date != null) {
      viewModels.add(MapEntry('Date', musicInfo.date!));
    }
    if (musicInfo.trackNo != null) {
      viewModels.add(MapEntry('Track No.', musicInfo.trackNo!.toString()));
    }
    if (musicInfo.composers != null) {
      viewModels.add(MapEntry('Composers', musicInfo.composers!.join(', ')));
    }
    if (musicInfo.lyricists != null) {
      viewModels.add(MapEntry('Lyricists', musicInfo.lyricists!.join(', ')));
    }
    if (musicInfo.arrangers != null) {
      viewModels.add(MapEntry('Arrangers', musicInfo.arrangers!.join(', ')));
    }
    if (musicInfo.confidence != null) {
      viewModels.add(MapEntry('Confidence', musicInfo.confidence!));
    }
    if (musicInfo.lowConfidenceReason != null) {
      viewModels.add(MapEntry('Reason', musicInfo.lowConfidenceReason!));
    }
    return viewModels;
  }

  @override
  Widget build(BuildContext context) {
    // If it's an exception, show the exception message.
    if (!musicInfo.hasData) {
      return AmiTextStyle(
        child: SelectableText(musicInfo.exception.toString()),
      );
    } else {
      // A table. No header.
      // Two columns in each row. The first column is for the entry and the second column is for the value.
      return Table(
        border: TableBorder.all(
          color: Colors.grey.withOpacity(0.3),
        ),
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
        },
        children: _toRowData(musicInfo.data!.musicInfo).map((e) {
          // How to make a table row with some padding?
          return TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AmiTextStyle(
                    child: Text(e.key),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AmiTextStyle(
                        child: SelectableText(e.value),
                      ),
                    ),
                  ),
                  SearchSessionResultPageCopyButton(textToCopy: e.value),
                ],
              ),
            ],
          );
        }).toList(),
      );
    }
  }
}
