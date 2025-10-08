import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_with_request_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_request.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_source_enum.dart';

class MusicInfoWithRequest {
  final MusicInfoRequest request;
  final MusicInfoRequest? convertedRequest;
  final MusicInfoSourceEnum source;
  final MusicInfo musicInfo;
  final String? think;
  final List<String> tools;

  MusicInfoWithRequest({
    required this.request,
    this.convertedRequest,
    required this.source,
    required this.musicInfo,
    this.think,
    required this.tools,
  });

  factory MusicInfoWithRequest.fromDto(MusicInfoWithRequestDto dto) {
    return MusicInfoWithRequest(
      request: MusicInfoRequest.fromDto(dto.request),
      convertedRequest: dto.convertedRequest != null
          ? MusicInfoRequest.fromDto(dto.convertedRequest!)
          : null,
      source: MusicInfoSourceEnum.fromServerCode(dto.source),
      musicInfo: MusicInfo.fromDto(dto.musicInfo),
      think: dto.think,
      tools: dto.tools,
    );
  }
}
