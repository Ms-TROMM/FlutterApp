import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/recommendation/add_clothes_page2.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class AddClothesPage1 extends StatefulWidget {
  const AddClothesPage1({Key? key}) : super(key: key);

  @override
  _AddClothesPage1State createState() => _AddClothesPage1State();
}

class _AddClothesPage1State extends State<AddClothesPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 옷 등록하기 (1/2)'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.5,
                decoration: BoxDecoration(color: Colors.grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    Text('카메라를 켜주세요!')
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              enableSuggestions: false,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: '이름을 입력해주세요! (최대 8글자)', isDense: true),
              validator: (value) {
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    // TODO Do something
                  });
                }
              },
            ),
          ), 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TrommButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddClothesPage2()));
              }, text: '다음'),
            )
          ],
        ),
      ),
    );
  }
}
