import 'dart:convert';

import 'package:auto_music_info/core/config/app_config/app_config.dart';
import 'package:auto_music_info/core/providers/ami_service/models/dto/server_message_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/dto/text_validity_result_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/text_language_enum.dart';
import 'package:auto_music_info/core/providers/ami_service/models/text_validity_result.dart';
import 'package:auto_music_info/core/providers/ami_service/text_checker_service.dart';
import 'package:http/http.dart';

class TextCheckerServiceImpl extends TextCheckerService {
  final AppConfig appConfig;
  final Client _httpClient = Client();

  TextCheckerServiceImpl({required this.appConfig});

  @override
  Future<TextValidityResult> checkTextValidity(
    String text,
    TextLanguageEnum? textLanguage,
  ) async {
    final resp = await _httpClient.get(
      Uri.parse(
          '${appConfig.serverEndpoint}/api/v1/text-checker/validity?text=$text&textLanguage=${textLanguage?.serverCode ?? ''}'),
    );

    if (resp.statusCode != 200) {
      throw Exception(
          'Failed to check text validity; text: $text; textLanguage: $textLanguage; statusCode: ${resp.statusCode}');
    }

    final respJson = jsonDecode(utf8.decode(resp.bodyBytes));
    final respDto = ServerMessageDto.fromJson(respJson);
    if (respDto.error != null) {
      throw Exception(
          'Failed to check text validity; text: $text; textLanguage: $textLanguage; error: ${respDto.error}');
    }

    final resultDto = TextValidityResultDto.fromJson(respDto.data);
    return TextValidityResult.fromDto(resultDto);
  }
}
