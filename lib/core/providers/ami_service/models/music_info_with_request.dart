import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_with_request_dto.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info.dart';
import 'package:auto_music_info/core/providers/ami_service/models/music_info_source_enum.dart';

class MusicInfoWithRequest {
  final String url;
  final String query;
  final MusicInfoSourceEnum source;
  final MusicInfo musicInfo;

  MusicInfoWithRequest({
    required this.url,
    required this.query,
    required this.source,
    required this.musicInfo,
  });

  factory MusicInfoWithRequest.fromDto(MusicInfoWithRequestDto dto) {
    return MusicInfoWithRequest(
      url: dto.url,
      query: dto.query,
      source: MusicInfoSourceEnum.fromServerCode(dto.source),
      musicInfo: MusicInfo.fromDto(dto.musicInfo),
    );
  }
}
