import 'package:flutter/material.dart';

class DisableableMaterialButtonWrapper extends StatelessWidget {
  final bool isEnabled;
  final bool visibleWhenDisabled;
  final RawMaterialButton child;

  const DisableableMaterialButtonWrapper({
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
