// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerMessageDto _$ServerMessageDtoFromJson(Map<String, dynamic> json) =>
    ServerMessageDto()
      ..data = json['data']
      ..error = json['error'] == null
          ? null
          : ServerExceptionDto.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$ServerMessageDtoToJson(ServerMessageDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
