import 'package:auto_music_info/core/providers/ami_service/models/music_info_with_request.dart';
import 'package:flutter/foundation.dart';

abstract class InfoExtractorService with ChangeNotifier {
  Future<MusicInfoWithRequest> extractInfo(String url, String query);
}
