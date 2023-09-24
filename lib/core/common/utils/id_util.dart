import 'package:uuid/uuid.dart';

/// Generates a random id that's composited of 2 random UUIDs
/// concatenated together, stripping all the "-" in the middle.
String generateLongId() {
  final String uuid1 = const Uuid().v4().replaceAll('-', '');
  final String uuid2 = const Uuid().v4().replaceAll('-', '');
  return uuid1 + uuid2;
}
