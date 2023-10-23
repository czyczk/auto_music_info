// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_validity_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextValidityResultDto _$TextValidityResultDtoFromJson(
        Map<String, dynamic> json) =>
    TextValidityResultDto()
      ..isValid = json['isValid'] as bool
      ..invalidIndex = json['invalidIndex'] as int?
      ..invalidChar = json['invalidChar'] as String?
      ..invalidReason = json['invalidReason'] as String?;

Map<String, dynamic> _$TextValidityResultDtoToJson(
        TextValidityResultDto instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'invalidIndex': instance.invalidIndex,
      'invalidChar': instance.invalidChar,
      'invalidReason': instance.invalidReason,
    };
