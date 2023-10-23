import 'package:json_annotation/json_annotation.dart';

part 'text_validity_result_dto.g.dart';

@JsonSerializable()
class TextValidityResultDto {
  late final bool isValid;
  late final int? invalidIndex;
  late final String? invalidChar;
  late final String? invalidReason;

  TextValidityResultDto();

  factory TextValidityResultDto.fromJson(Map<String, dynamic> json) =>
      _$TextValidityResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TextValidityResultDtoToJson(this);
}
