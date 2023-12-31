import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:flutter/material.dart';

class SearchResultEntryCheckbox extends StatefulWidget {
  final bool initialValue;
  final void Function(bool?) onChanged;

  const SearchResultEntryCheckbox({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return _SearchResultEntryCheckboxState();
  }
}

class _SearchResultEntryCheckboxState extends State<SearchResultEntryCheckbox> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      padding: const EdgeInsets.all(0),
      constraints: const BoxConstraints(
        minWidth: 28,
        minHeight: 28,
        maxWidth: 28,
        maxHeight: 28,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Transform.scale(
        scale: 0.8,
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Checkbox(
            value: value,
            onChanged: (v) {
              setState(() {
                value = v!;
                widget.onChanged(v);
              });
            },
            hoverColor: Colors.transparent,
            activeColor: context.theme.colorSchemeExtended.tertiary,
            checkColor: context.theme.colorSchemeExtended.onTertiary,
            splashRadius: 0.0,
            side: const BorderSide(
              width: 1.0,
            ),
            materialTapTargetSize:
                MaterialTapTargetSize.shrinkWrap, // Minimum margin
          ),
        ),
      ),
    );
  }
}
