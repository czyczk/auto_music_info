import 'package:auto_music_info/core/common/scene_info_model.dart';
import 'package:auto_music_info/core/config/app_config/app_config.dart';
import 'package:auto_music_info/core/config/scene_config/scene_config.dart';
import 'package:auto_music_info/module/sidebar/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SceneManagerScaffold extends StatefulWidget {
  const SceneManagerScaffold({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SceneManagerScaffoldState();
}

class _SceneManagerScaffoldState extends State<SceneManagerScaffold> {
  // The initial scene is the first scene in the list.
  SceneInfo activeScene =
      SceneConfig.sceneNameInfoMap[SceneConfig.sceneOnTopOrder.first]!;

  void onSidebarItemTap(SceneInfo sceneInfo) {
    if (activeScene == sceneInfo) {
      return;
    }

    setState(() {
      activeScene = sceneInfo;
    });
  }

  void _createNewThread() {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = Provider.of<AppConfig>(context);

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 200,
            child: Sidebar(
                activeScene: activeScene, onSidebarItemTap: onSidebarItemTap),
          ),
          Expanded(
              child: IndexedStack(
            index: SceneConfig.sceneNameIndexMap[activeScene.name]!,
            children: SceneConfig.sceneIndexWidgetMap.values.toList(),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewThread,
        tooltip: 'New thread',
        child: const Icon(Icons.add),
      ),
    );
  }
}
