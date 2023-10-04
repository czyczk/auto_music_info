import 'dart:convert';

import 'package:auto_music_info/core/config/app_config/app_config.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_result_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_results.dart';
import 'package:auto_music_info/core/providers/ami_service/search_service.dart';
import 'package:http/http.dart';

class SearchServiceImpl extends SearchService {
  final AppConfig appConfig;
  final Client _httpClient = Client();

  SearchServiceImpl({required this.appConfig});

  @override
  Future<SearchResults> searchWithKeyword(String keyword) async {
    final resp = await _httpClient.get(
      Uri.parse(
          '${appConfig.serverEndpoint}/api/v1/google/integrated?query=$keyword'),
    );

    if (resp.statusCode != 200) {
      throw Exception(
          'Failed to search with keyword; keyword: $keyword; statusCode: ${resp.statusCode}');
    }

    final searchResultDto =
        jsonDecode(resp.body).cast<Map<String, SearchResultDto>>();
    return SearchResults.fromIntegratedDto(searchResultDto);
  }
}
