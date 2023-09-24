import 'dart:convert';
import 'dart:io';

import 'package:auto_music_info/core/config/app_config/app_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

String _appConfigFilename = 'config.json';

Future<AppConfig> loadAppConfig() async {
  // Load the config file from the Documents directory.
  final configFilePath = '${(await _getConfigDir()).path}/$_appConfigFilename';
  final configFile = File(configFilePath);
  if (!await configFile.exists()) {
    throw Exception('Config file not found at $configFilePath.');
  }

  final appConfigContent = await configFile.readAsString();

  // Sleep for 1 sec
  await Future.delayed(const Duration(seconds: 1));

  Map<String, dynamic> jsonMap = jsonDecode(appConfigContent);
  AppConfig appConfig = AppConfig.fromJson(jsonMap);
  return appConfig;
}

Future<Directory> _getConfigDir() async {
  /*
   * Base directory:
   * For macOS and Linux, use the "$HOME/.config" directory.
   * For Windows, use "%UserProfile%\\.config" directory.
   * For others, use the Documents directory.
   */
  Directory baseDir;
  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    Map<String, String> envVars = Platform.environment;
    if (Platform.isMacOS || Platform.isLinux) {
      baseDir = Directory("${envVars['HOME']!}/.config");
    } else {
      baseDir = Directory("${envVars['UserProfile']!}/.config");
    }
  } else {
    baseDir = await getApplicationDocumentsDirectory();
  }

  final packageInfo = await PackageInfo.fromPlatform();
  final appName = packageInfo.appName;

  // The config dir is ${baseDir}/${appName}.
  Directory configDir = Directory('${baseDir.path}/$appName');
  return configDir;
}
