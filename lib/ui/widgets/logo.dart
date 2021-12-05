import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final EdgeInsets edgeInsets;
  const Logo({Key? key, required this.edgeInsets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _logoColor();
  }

  _logoColor() {
    return Padding(
      padding: edgeInsets,
      child: const Text.rich(
        TextSpan(children: [
          TextSpan(
              text: 'Ms.',
              style: TextStyle(
                  fontFamily: 'jalnan',
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.grey)),
          TextSpan(
              text: 'TROMM',
              style: TextStyle(
                  fontFamily: 'jalnan',
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.blue)),
        ]),
      ),
    );
  }
}
