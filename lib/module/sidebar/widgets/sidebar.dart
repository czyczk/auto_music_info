import 'package:auto_music_info/core/common/scene_info_model.dart';
import 'package:auto_music_info/core/config/color_scheme/app_pallet.dart';
import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/core/config/scene_config/scene_config.dart';
import 'package:auto_music_info/module/sidebar/widgets/sidebar_item.dart';
import 'package:auto_music_info/module/sidebar/widgets/sidebar_row_button.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar(
      {Key? key, required this.activeScene, required this.onSidebarItemTap})
      : super(key: key);

  final SceneInfo activeScene;

  final Function(SceneInfo) onSidebarItemTap;

  @override
  State<Sidebar> createState() => SidebarState();
}

class SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minWidth: 200, minHeight: 500),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            SidebarRowButton(
              icon: Icons.add,
              text: 'New thread',
              colorSet: AppPalette.moderateVividOrange,
              onTap: () {
                // TODO
              },
            ),
            ...SceneConfig.sceneOnTopOrder.map((e) {
              final SceneInfo sceneInfo = SceneConfig.sceneNameInfoMap[e]!;
              return SidebarItem(
                sceneInfo: sceneInfo,
                isSelected: widget.activeScene == sceneInfo,
                onTap: widget.onSidebarItemTap,
              );
            }).toList(),
            Expanded(
                child: Container(
                    color: context.theme.colorSchemeExtended.primary)),
            ...SceneConfig.sceneOnBottomOrder.map((e) {
              final SceneInfo sceneInfo = SceneConfig.sceneNameInfoMap[e]!;
              return SidebarItem(
                sceneInfo: sceneInfo,
                isSelected: widget.activeScene == sceneInfo,
                onTap: widget.onSidebarItemTap,
              );
            }).toList(),
          ],
        ));
  }
}
