import 'package:auto_music_info/core/providers/ami_service/models/dto/text_validity_result_dto.dart';

class TextValidityResult {
  final bool isValid;
  final int? invalidIndex;
  final String? invalidChar;
  final String? invalidReason;

  const TextValidityResult({
    required this.isValid,
    this.invalidIndex,
    this.invalidChar,
    this.invalidReason,
  });

  factory TextValidityResult.ofValid() {
    return const TextValidityResult(isValid: true);
  }

  factory TextValidityResult.ofInvalid({
    required int invalidIndex,
    required String invalidChar,
    required String invalidReason,
  }) {
    return TextValidityResult(
      isValid: false,
      invalidIndex: invalidIndex,
      invalidChar: invalidChar,
      invalidReason: invalidReason,
    );
  }

  factory TextValidityResult.fromDto(TextValidityResultDto dto) {
    return TextValidityResult(
      isValid: dto.isValid,
      invalidIndex: dto.invalidIndex,
      invalidChar: dto.invalidChar,
      invalidReason: dto.invalidReason,
    );
  }
}
