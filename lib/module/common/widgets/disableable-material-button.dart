import 'package:flutter/material.dart';

class DisableableMaterialButtonWrapper extends StatelessWidget {
  bool isEnabled;
  bool visibleWhenDisabled;
  RawMaterialButton child;

  DisableableMaterialButtonWrapper({
    super.key,
    this.isEnabled = true,
    this.visibleWhenDisabled = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double opacity = isEnabled
        ? 1
        : visibleWhenDisabled
            ? 0.5
            : 0;

    return AbsorbPointer(
      absorbing: !isEnabled,
      child: Opacity(
        opacity: opacity,
        child: child,
      ),
    );
  }
}
