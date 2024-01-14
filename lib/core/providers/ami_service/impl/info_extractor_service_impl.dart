import 'dart:convert';

import 'package:auto_music_info/core/config/app_config/app_config.dart';
import 'package:auto_music_info/core/providers/ami_service/info_extractor_service.dart';
import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_with_request_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/dto/server_message_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_with_request.dart';
import 'package:http/http.dart';

class InfoExtractorServiceImpl extends InfoExtractorService {
  final AppConfig appConfig;
  final Client _httpClient = Client();

  InfoExtractorServiceImpl({required this.appConfig});

  @override
  Future<MusicInfoWithRequest> extractInfo(String url, String query) async {
    final resp = await _httpClient.post(
      Uri.parse('${appConfig.serverEndpoint}/api/v1/info-extractor/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'url': url,
        'query': query,
      }),
    );
    final respBody = utf8.decode(resp.bodyBytes);

    if (resp.statusCode != 200) {
      throw Exception(
          'Failed to get result from info extractor; url: $url; query: $query; statusCode: ${resp.statusCode}; body: ${respBody.isEmpty ? '<empty>' : respBody}');
    }

    final respJson = jsonDecode(respBody);
    final respDto = ServerMessageDto.fromJson(respJson);
    if (respDto.error != null) {
      throw Exception(
          'Failed to get result from info extractor because of server error; url: $url; query: $query; errorCode: ${respDto.error!.errorCode}; errorMessage: ${respDto.error!.message}');
    }

    final musicInfoWithRequestDto =
        MusicInfoWithRequestDto.fromJson(respDto.data);
    return MusicInfoWithRequest.fromDto(musicInfoWithRequestDto);
  }
}
