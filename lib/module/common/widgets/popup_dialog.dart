import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopupDialog extends StatelessWidget {
  static final actionButtonShape = MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static final actionButtonMinimumSize = MaterialStateProperty.all(
    const Size.fromHeight(48.0),
  );

  final String title;
  final String message;
  final VoidCallback onOk;
  final VoidCallback onCancel;
  final String okText;
  final String cancelText;

  const PopupDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onOk,
    required this.onCancel,
    this.okText = 'Ok',
    this.cancelText = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent event) {
        if (event is KeyDownEvent &&
            event.isKeyPressed(LogicalKeyboardKey.enter)) {
          onOk();
        }
      },
      child: AlertDialog(
        backgroundColor: context.theme.colorSchemeExtended.surface,
        title: Text(title),
        content: Text(message),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        actionsPadding: const EdgeInsets.all(0),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                ),
                child: TextButton(
                  onPressed: () => onOk(),
                  style: ButtonStyle(
                    shape: actionButtonShape,
                    minimumSize: actionButtonMinimumSize,
                    foregroundColor: MaterialStateProperty.all(
                      context.theme.colorSchemeExtended.tertiary,
                    ),
                  ),
                  child: Text(okText),
                ),
              ),
            ),
            const VerticalDivider(
              color: Colors.grey,
              width: 1,
              thickness: 1,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                ),
                child: TextButton(
                  onPressed: () => onCancel(),
                  style: ButtonStyle(
                    shape: actionButtonShape,
                    minimumSize: actionButtonMinimumSize,
                    foregroundColor: MaterialStateProperty.all(
                      context.theme.colorSchemeExtended.primary,
                    ),
                  ),
                  child: Text(cancelText),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
