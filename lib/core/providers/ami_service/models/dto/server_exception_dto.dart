import 'package:json_annotation/json_annotation.dart';

part 'server_exception_dto.g.dart';

@JsonSerializable()
class ServerExceptionDto {
  late final String code;

  late final String message;

  ServerExceptionDto();

  factory ServerExceptionDto.fromJson(Map<String, dynamic> json) =>
      _$ServerExceptionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServerExceptionDtoToJson(this);
}
