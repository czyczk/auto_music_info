import 'package:json_annotation/json_annotation.dart';

part 'music_info_request_dto.g.dart';

@JsonSerializable()
class MusicInfoRequestDto {
  final String? url;
  final String? structuredDoc;
  final String query;
  final int? timeout;

  MusicInfoRequestDto({
    required this.query,
    this.timeout,
    this.url,
    this.structuredDoc,
  });

  factory MusicInfoRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MusicInfoRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MusicInfoRequestDtoToJson(this);
}
