import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/module/common/widgets/disableable-material-button.dart';
import 'package:flutter/material.dart';

class SearchSessionPageSwitcherButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Function determineButtonEnabled;

  const SearchSessionPageSwitcherButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.determineButtonEnabled,
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
          size: 24.0,
          color: context.theme.colorSchemeExtended.onPrimary,
        ),
      ),
    );
  }
}
