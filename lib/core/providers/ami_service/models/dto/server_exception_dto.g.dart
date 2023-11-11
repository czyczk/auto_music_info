// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_exception_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerExceptionDto _$ServerExceptionDtoFromJson(Map<String, dynamic> json) =>
    ServerExceptionDto()
      ..errorCode = json['errorCode'] as String
      ..message = json['message'] as String;

Map<String, dynamic> _$ServerExceptionDtoToJson(ServerExceptionDto instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'message': instance.message,
    };
