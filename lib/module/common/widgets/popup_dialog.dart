import 'package:flutter/material.dart';

class PopupDialog extends StatelessWidget {
  static final actionButtonShape = MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
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
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      actionsPadding: const EdgeInsets.all(0),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: TextButton(
              onPressed: () => onOk(),
              style: ButtonStyle(
                shape: actionButtonShape,
              ),
              child: Text(okText),
            ),
          ),
          const VerticalDivider(
            color: Colors.grey,
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: TextButton(
              onPressed: () => onCancel(),
              style: ButtonStyle(
                shape: actionButtonShape,
              ),
              child: Text(cancelText),
            ),
          )
        ]),
      ],
    );
  }
}
