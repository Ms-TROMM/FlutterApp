import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class AddClothesPage2 extends StatefulWidget {
  const AddClothesPage2({Key? key}) : super(key: key);

  @override
  _AddClothesPage2State createState() => _AddClothesPage2State();
}

class _AddClothesPage2State extends State<AddClothesPage2> {

  var selectedValue1 = 'A';
  var selectedValue2 = 'B';
  var selectedValue3 = 'C';
  var selectedValue4 = 'D';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 옷 등록하기 (2/2)'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('카테고리'),
            DropdownButton<String>(
              value: selectedValue1,
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue1 = value!;
                });
              },
            ),
            Text('하위카테고리'),
            DropdownButton<String>(
              value: selectedValue2,
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
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
            Text('색상'),
            DropdownButton<String>(
              value: selectedValue3,
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
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
            Text('재질'),
            DropdownButton<String>(
              value: selectedValue4,
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
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
            )
          ],
        ),
      ),
    );
  }
}
