import 'package:flutter/material.dart';

Future<void> _showMyDialog(
  BuildContext context,
  String title,
  String content,
  String buttonText,
  VoidCallback? onPressed,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(content),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(buttonText),
            onPressed: () {
              onPressed!();
            },
          ),
        ],
      );
    },
  );
}
