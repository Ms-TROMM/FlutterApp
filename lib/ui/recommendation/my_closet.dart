import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyClosetPage extends StatefulWidget {
  const MyClosetPage({Key? key}) : super(key: key);

  @override
  _MyClosetPageState createState() => _MyClosetPageState();
}

class _MyClosetPageState extends State<MyClosetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 옷장'),
      ),
      body: Center(
        child: Text('옷장이 비어있습니다!'),
      ),
    );
  }
}
