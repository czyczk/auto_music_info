import 'package:auto_music_info/core/providers/ami_service/models/text_language_enum.dart';
import 'package:auto_music_info/core/providers/ami_service/models/text_validity_result.dart';
import 'package:auto_music_info/core/providers/ami_service/text_checker_service.dart';

class DummyTextCheckerServiceImpl extends TextCheckerService {
  @override
  Future<TextValidityResult> checkTextValidity(
    String text,
    TextLanguageEnum? textLanguage,
  ) async {
    if (text.contains('invalid')) {
      return TextValidityResult.ofInvalid(
          invalidIndex: 2,
          invalidChar: 'v',
          invalidReason: 'Whatever a dummy reason.');
    } else {
      return TextValidityResult.ofValid();
    }
  }
}
