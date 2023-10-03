import 'package:auto_music_info/module/scene_manager_scaffold/widgets/scene_manager_scaffold.dart';
import 'package:auto_music_info/module/search_history_carousel/screens/search_history_carousel.dart';
import 'package:flutter/material.dart';

class HistoryScene extends StatelessWidget {
  const HistoryScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchHistoryCarousel();
  }
}
