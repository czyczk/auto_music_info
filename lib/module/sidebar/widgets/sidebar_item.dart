import 'package:auto_music_info/core/common/scene_info_model.dart';
import 'package:auto_music_info/core/common/styles/app_global_styles.dart';
import 'package:auto_music_info/core/config/color_scheme/app_pallet.dart';
import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:flutter/material.dart';

class SidebarItem extends StatefulWidget {
  const SidebarItem(
      {Key? key,
      required this.sceneInfo,
      required this.isSelected,
      required this.onTap,
      this.colorSet})
      : super(key: key);

  final SceneInfo sceneInfo;

  final bool isSelected;

  final Function(SceneInfo) onTap;

  final ColorSet? colorSet;

  @override
  State<StatefulWidget> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  bool _isHovered = false;

  Color _determineBackgroundColor(ThemeData theme, bool isSelected) {
    if (widget.colorSet == null) {
      if (isSelected) {
        return theme.colorSchemeExtended.primaryActive;
      } else if (_isHovered) {
        return theme.colorSchemeExtended.primaryHover;
      } else {
        return theme.colorSchemeExtended.primary;
      }
    } else {
      if (isSelected) {
        return widget.colorSet!.backgroundActive;
      } else if (_isHovered) {
        return widget.colorSet!.backgroundHover;
      } else {
        return widget.colorSet!.background;
      }
    }
  }

  Color _determineForegroundColor(ThemeData theme, bool isSelected) {
    if (widget.colorSet == null) {
      if (isSelected) {
        return theme.colorSchemeExtended.onPrimaryActive;
      } else if (_isHovered) {
        return theme.colorSchemeExtended.onPrimaryHover;
      } else {
        return theme.colorSchemeExtended.onPrimary;
      }
    } else {
      if (isSelected) {
        return widget.colorSet!.foregroundActive;
      } else if (_isHovered) {
        return widget.colorSet!.foregroundHover;
      } else {
        return widget.colorSet!.foreground;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) => setState(() => _isHovered = true),
        onExit: (event) => setState(() => _isHovered = false),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutQuad,
            constraints: BoxConstraints(
                minWidth: context.appGlobalStyles.sidebarWidth,
                minHeight: context.appGlobalStyles.sidebarItemHeight),
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            color: _determineBackgroundColor(context.theme, widget.isSelected),
            child: Center(
                child: ListTile(
              leading: Icon(
                widget.sceneInfo.icon,
                color:
                    _determineForegroundColor(context.theme, widget.isSelected),
              ),
              title: Text(
                widget.sceneInfo.name,
                style: TextStyle(
                  color: _determineForegroundColor(
                      context.theme, widget.isSelected),
                ),
              ),
              onTap: () => widget.onTap(widget.sceneInfo),
            ))));
  }
}
