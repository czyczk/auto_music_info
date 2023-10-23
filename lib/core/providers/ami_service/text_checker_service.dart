import 'package:auto_music_info/core/providers/ami_service/models/text_language_enum.dart';
import 'package:auto_music_info/core/providers/ami_service/models/text_validity_result.dart';
import 'package:flutter/foundation.dart';

abstract class TextCheckerService with ChangeNotifier {
  Future<TextValidityResult> checkTextValidity(
    String text,
    TextLanguageEnum? textLanguage,
  );
}
