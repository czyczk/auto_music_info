import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchSessionResultPageCopyButton extends StatelessWidget {
  final String textToCopy;

  const SearchSessionResultPageCopyButton({
    super.key,
    required this.textToCopy,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: textToCopy));
      },
      padding: const EdgeInsets.all(8),
      // Make the button compact (remove additional paddings)
      constraints: const BoxConstraints(
        minWidth: 0,
        minHeight: 0,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: const Icon(
        Icons.copy,
        size: 12,
      ),
    );
  }
}
