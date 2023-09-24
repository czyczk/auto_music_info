import 'package:auto_music_info/core/common/scene_info_model.dart';
import 'package:auto_music_info/module/scene/widgets/history_scene.dart';
import 'package:auto_music_info/module/scene/widgets/search_scene.dart';
import 'package:auto_music_info/module/scene/widgets/settings_scene.dart';
import 'package:flutter/material.dart';

class SceneConfig {
  static const List<String> sceneOnTopOrder = [
    'Search',
    'History',
  ];

  static const List<String> sceneOnBottomOrder = [
    'Settings',
  ];

  static const Map<String, int> sceneNameIndexMap = {
    'Search': 0,
    'History': 1,
    'Settings': 2,
  };

  static const Map<String, SceneInfo> sceneNameInfoMap = {
    'Search': SceneInfo(
      name: 'Search',
      icon: Icons.search,
    ),
    'History': SceneInfo(
      name: 'History',
      icon: Icons.history,
    ),
    'Settings': SceneInfo(
      name: 'Settings',
      icon: Icons.settings,
    ),
  };

  static const Map<String, Widget> sceneIndexWidgetMap = {
    'Search': SearchScene(),
    'History': HistoryScene(),
    'Settings': SettingsScene(),
  };

  static String getSceneNameByIndex(int index) {
    return sceneNameIndexMap.keys
        .firstWhere((key) => sceneNameIndexMap[key] == index);
  }
}
