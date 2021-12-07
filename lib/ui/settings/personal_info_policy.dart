import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PersonalPolicy extends StatefulWidget {
  const PersonalPolicy({Key? key}) : super(key: key);

  @override
  _PersonalPolicyState createState() => _PersonalPolicyState();
}

class _PersonalPolicyState extends State<PersonalPolicy> {

  Future<String> loadAsset() async {
    return await DefaultAssetBundle.of(context).loadString('assets/files/markdown_personal.md');
  }

  String data = "";

  @override
  void initState() {
    super.initState();
    loadAsset().then((String value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('개인정보약관')),
      body: Markdown(
        data: data,
      ),
    );
  }
}
