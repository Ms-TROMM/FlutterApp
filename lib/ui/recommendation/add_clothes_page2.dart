import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class AddClothesPage2 extends StatefulWidget {
  final String imagePath;

  const AddClothesPage2({Key? key, required this.imagePath}) : super(key: key);

  @override
  _AddClothesPage2State createState() => _AddClothesPage2State();
}

class _AddClothesPage2State extends State<AddClothesPage2> {
  static const selection1 = <String>['상의', '하의'];
  static const selection2 = <String>['후드티', '와이셔츠', '파카', '코트'];
  static const selection3 = <String>['빨강색', '주황색', '노란색', '초록색'];
  static const selection4 = <String>['울', '면'];

  var selectedValue1 = selection1[0];
  var selectedValue2 = selection2[0];
  var selectedValue3 = selection3[0];
  var selectedValue4 = selection4[0];

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text('새 옷 등록하기 (2/2)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.file(File(widget.imagePath), fit: BoxFit.fill,)
              ),
              spacer,
              Text(
                '옷 이름',
                style: style,
              ),
              spacer,
              TextFormField(
                enableSuggestions: false,
                autocorrect: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '이름을 입력해주세요! (최대 8글자)',
                    isDense: true),
                validator: (value) {},
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
// TODO Do something
                    });
                  }
                },
              ),
              spacer_2x,
              Text(
                '카테고리',
                style: style,
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedValue1,
                items: selection1.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue1 = value!;
                  });
                },
              ),
              spacer_2x,
              Text(
                '하위카테고리',
                style: style,
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedValue2,
                items: selection2.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue2 = value!;
                  });
                },
              ),
              spacer_2x,
              Text(
                '색상',
                style: style,
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedValue3,
                items: selection3.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue3 = value!;
                  });
                },
              ),
              spacer_2x,
              Text(
                '재질',
                style: style,
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedValue4,
                items: selection4.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue4 = value!;
                  });
                },
              ),
              spacer_2x,
              TrommButton(
                  onPressed: () {
                    // TODO POST 요청 날리기
                  },
                  text: '등록하기')
            ],
          ),
        ),
      ),
    );
  }
}
