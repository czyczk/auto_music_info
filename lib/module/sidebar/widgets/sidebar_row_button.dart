import 'package:auto_music_info/core/config/color_scheme/app_pallet.dart';
import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/module/common/widgets/ami_text_style.dart';
import 'package:flutter/material.dart';

class SidebarRowButton extends StatefulWidget {
  const SidebarRowButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onTap,
      this.colorSet})
      : super(key: key);

  final IconData icon;

  final String text;

  final Function() onTap;

  final ColorSet? colorSet;

  @override
  State<StatefulWidget> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarRowButton> {
  bool _isHovered = false;

  Color _determineBackgroundColor(ThemeData theme) {
    if (widget.colorSet == null) {
      if (_isHovered) {
        return theme.colorSchemeExtended.primaryHover;
      } else {
        return theme.colorSchemeExtended.primary;
      }
    } else {
      if (_isHovered) {
        return widget.colorSet!.backgroundHover;
      } else {
        return widget.colorSet!.background;
      }
    }
  }

  Color _determineForegroundColor(ThemeData theme) {
    if (widget.colorSet == null) {
      if (_isHovered) {
        return theme.colorSchemeExtended.onPrimaryHover;
      } else {
        return theme.colorSchemeExtended.onPrimary;
      }
    } else {
      if (_isHovered) {
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
            constraints: const BoxConstraints(minWidth: 200, minHeight: 60),
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            color: _determineBackgroundColor(context.theme),
            child: Center(
                child: ListTile(
              leading: Icon(
                widget.icon,
                color: _determineForegroundColor(context.theme),
              ),
              title: AmiTextStyle(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: _determineForegroundColor(context.theme),
                  ),
                ),
              ),
              onTap: () => widget.onTap(),
            ))));
  }
}
