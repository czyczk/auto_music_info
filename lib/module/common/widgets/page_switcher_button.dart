import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/module/common/widgets/disableable_material_button.dart';
import 'package:flutter/material.dart';

class PageSwitcherButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Function determineButtonEnabled;
  final double buttonIconSize;

  const PageSwitcherButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.determineButtonEnabled,
    this.buttonIconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisableableMaterialButtonWrapper(
      isEnabled: determineButtonEnabled(),
      visibleWhenDisabled: false,
      child: RawMaterialButton(
        onPressed: () => onPressed(),
        shape: const CircleBorder(),
        hoverColor: context.theme.colorSchemeExtended.primaryHover,
        splashColor: Colors.transparent,
        child: Icon(
          icon,
          size: buttonIconSize,
          color: context.theme.colorSchemeExtended.onPrimary,
        ),
      ),
    );
  }
}
