import 'package:auto_music_info/core/providers/ami_service/models/search_results.dart';
import 'package:flutter/foundation.dart';

abstract class SearchService with ChangeNotifier {
  Future<SearchResults> searchWithKeyword(String keyword);
}
