import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_with_request_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_request.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_source_enum.dart';

class MusicInfoWithRequest {
  final MusicInfoRequest request;
  final MusicInfoSourceEnum source;
  final MusicInfo musicInfo;
  final String? think;

  MusicInfoWithRequest({
    required this.request,
    required this.source,
    required this.musicInfo,
    this.think,
  });

  factory MusicInfoWithRequest.fromDto(MusicInfoWithRequestDto dto) {
    return MusicInfoWithRequest(
      request: MusicInfoRequest.fromDto(dto.request),
      source: MusicInfoSourceEnum.fromServerCode(dto.source),
      musicInfo: MusicInfo.fromDto(dto.musicInfo),
      think: dto.think,
    );
  }
}
