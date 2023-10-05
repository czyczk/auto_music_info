import 'dart:convert';

import 'package:auto_music_info/core/config/app_config/app_config.dart';
import 'package:auto_music_info/core/providers/ami_service/models/dto/search_result_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/dto/server_message_dto.dart';
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

    final respJson = jsonDecode(utf8.decode(resp.bodyBytes));
    final respDto = ServerMessageDto.fromJson(respJson);
    final dtoMap = Map<String, SearchResultDto>.fromEntries(
      (respDto.data as Map).entries.map(
            (entry) => MapEntry(
              entry.key,
              SearchResultDto.fromJson(entry.value),
            ),
          ),
    );
    return SearchResults.fromIntegratedDto(dtoMap);
  }
}
