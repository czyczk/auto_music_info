import 'dart:math';

import 'package:auto_music_info/core/providers/ami_service/info_extractor_service.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_source_enum.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_with_request.dart';

class DummyInfoExtractorServiceImpl extends InfoExtractorService {
  final List<MusicInfo> dummyMusicInfoList = [
    MusicInfo(
      artists: ['Dummy Artist', 'Dummy Jr. Artist 2'],
      title: 'Dummy Title',
      album: 'Dummy Album',
      date: 'YYYY-MM-DD',
      trackNo: 23,
      composers: ['Dummy Composer', 'Dummy Jr. Composer 2'],
      lyricists: ['Dummy Lyricist', 'Dummy Jr. Lyricist 2'],
      arrangers: ['Dummy Arranger', 'Dummy Jr. Arranger 2'],
      confidence: 'LOW',
      lowConfidenceReason: 'Dummy reason. Not enough info on this dummy site.',
    ),
    MusicInfo(
      artists: ['Dummy Artist', 'Dummy Jr. Artist 2'],
      title: 'Dummy Title',
      date: 'YYYY-MM-DD',
      trackNo: 23,
      composers: ['Dummy Composer', 'Dummy Jr. Composer 2'],
      confidence: 'HIGH',
    ),
    MusicInfo(
      artists: ['Dummy Artist', 'Dummy Jr. Artist 2'],
      title: 'Dummy Title',
      date: 'YYYY-MM-DD',
      trackNo: 23,
      composers: ['Dummy Composer', 'Dummy Jr. Composer 2'],
      lyricists: ['Dummy Lyricist', 'Dummy Jr. Lyricist 2'],
      arrangers: ['Dummy Arranger', 'Dummy Jr. Arranger 2'],
      confidence: 'HIGH',
    ),
  ];

  final MusicInfo longDummyMusicInfo = MusicInfo(
    title: 'Dummy Long Long Long Long Long Long Title',
    artists: [
      'Dummy Long Long Long Long Long Long Long Artist',
      'Dummy Long Long Long Long Long Long Long Jr. Artist 2'
    ],
    album: 'Dummy Long Long Long Long Long Long Long Long Long Long Album',
    date: 'YYYY-MM-DD',
    trackNo: 23,
    composers: [
      'Dummy Long Long Long Long Long Long Long Composer',
      'Dummy Long Long Long Long Long Long Long Jr. Composer 2'
    ],
    lyricists: [
      'Dummy Long Long Long Long Long Long Long Lyricist',
      'Dummy Long Long Long Long Long Long Long Jr. Lyricist 2'
    ],
    arrangers: [
      'Dummy Long Long Long Long Long Long Long Arranger',
      'Dummy Long Long Long Long Long Long Long Jr. Arranger 2'
    ],
    confidence: 'LOW',
    lowConfidenceReason:
        'Long long long long long long long long long dummy reason. Not enough info on this dummy site.',
  );

  MusicInfoWithRequest generateDummyResponse(String url, String query) {
    final MusicInfo musicInfo;
    if (query.toLowerCase().contains('long')) {
      musicInfo = longDummyMusicInfo;
    } else {
      final randomIndex = Random().nextInt(dummyMusicInfoList.length);
      musicInfo = dummyMusicInfoList[randomIndex];
    }

    final randomSource = MusicInfoSourceEnum
        .values[Random().nextInt(MusicInfoSourceEnum.values.length)];

    return MusicInfoWithRequest(
      url: url,
      query: query,
      source: randomSource,
      musicInfo: musicInfo,
    );
  }

  @override
  Future<MusicInfoWithRequest> extractInfo(String url, String query) async {
    // Sleep for a random amount of time between [300, 800]
    final random = Random().nextInt(500) + 300;
    await Future.delayed(Duration(milliseconds: random));
    return generateDummyResponse(url, query);
  }
}
