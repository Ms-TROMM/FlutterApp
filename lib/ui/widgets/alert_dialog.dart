import 'package:flutter/material.dart';

AlertDialog yesOrNoDialog(BuildContext context, String? title, String content,
    VoidCallback onYes, VoidCallback onNo) {
  return AlertDialog(
    title: Text(title ?? ''),
    content: Text(content),
    actions: [
      TextButton(
          onPressed: () {
            onYes();
          },
          child: const Text('확인')),
      TextButton(
          onPressed: () {
            onNo();
            Navigator.of(context).pop();
          },
          child: const Text(
            '취소',
            style: TextStyle(color: Colors.red),
          )),
    ],
  );
}

AlertDialog simpleDialog(
    BuildContext context, String? title, String content, VoidCallback? onYes) {
  return AlertDialog(
    title: Text(title ?? ''),
    content: Text(content),
    actions: [
      TextButton(
          onPressed: () {
            if (onYes != null) {
              onYes();
            }
            Navigator.of(context).pop();
          },
          child: const Text('확인')),
    ],
  );
}

/**
 *
 showDialog(context: context, builder: (context) =>
    yesOrNoDialog(context, "Title", "content", (){
    // do nothing
    }, () {
    // close
    }));
 * */
