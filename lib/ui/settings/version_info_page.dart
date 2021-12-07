import 'package:flutter/material.dart';

class VersionPage extends StatelessWidget {
  const VersionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('버전 정보')),
      body: const Center(
        child: Text(
          'MS.TROMM\nVERSION 1.0.0',
          style: TextStyle(
            fontFamily: 'Jalnan',
            fontSize: 32
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
