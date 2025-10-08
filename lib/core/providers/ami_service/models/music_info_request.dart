import 'package:auto_music_info/core/providers/ami_service/models/dto/music_info_request_dto.dart';

class MusicInfoRequest {
  final String? url;
  final String? structuredDoc;
  final String query;
  final int? timeout;

  MusicInfoRequest({
    required this.query,
    this.url,
    this.structuredDoc,
    this.timeout,
  });

  factory MusicInfoRequest.fromDto(MusicInfoRequestDto dto) {
    return MusicInfoRequest(
      url: dto.url,
      structuredDoc: dto.structuredDoc,
      query: dto.query,
      timeout: dto.timeout,
    );
  }
}
