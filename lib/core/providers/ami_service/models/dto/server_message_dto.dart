import 'package:auto_music_info/core/providers/ami_service/models/dto/server_exception_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server_message_dto.g.dart';

@JsonSerializable()
class ServerMessageDto {
  late final dynamic data;

  late final ServerExceptionDto? error;

  ServerMessageDto();

  factory ServerMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ServerMessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServerMessageDtoToJson(this);
}
