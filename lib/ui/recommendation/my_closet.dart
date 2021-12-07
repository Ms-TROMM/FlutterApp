import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';

import 'add_clothes_page1.dart';

class MyClosetPage extends StatefulWidget {
  const MyClosetPage({Key? key}) : super(key: key);

  @override
  _MyClosetPageState createState() => _MyClosetPageState();
}

class _MyClosetPageState extends State<MyClosetPage> {
  var clothes = [
    Clothes(0, 'this.name', "this.category", 0xfff, 0, "this.texture", true,
        "this.createdAt", "this.styleredAt"),
    Clothes(0, 'this.name', "this.category", 0xfff, 0, "this.texture", false,
        "this.createdAt", "this.styleredAt"),
    Clothes(0, 'this.name', "this.category", 0xfff, 0, "this.texture", true,
        "this.createdAt", "this.styleredAt"),
    Clothes(0, 'this.name', "this.category", 0xfff, 0, "this.texture", false,
        "this.createdAt", "this.styleredAt"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('내 옷장'),
          actions: [
            IconButton(icon: Icon(Icons.add_a_photo), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddClothesPage1()));
            },)
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: clothes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ////// first row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/icon_map_clothing_store.png',
                          width: 48,
                        ),
                        Column(children: [
                          Text(clothes[index].isNeedStyler ? "스타일러가 필요해요 ;)" : '이 옷은 괜찮아요!'),
                          Text(clothes[index].name)
                        ]),
                        Image.asset(
                          clothes[index].isNeedStyler ? 'assets/images/icon_feather_bookmark.png' : 'assets/images/icon_feather_bookmark_blue.png',
                          width: 24,
                        ),
                      ],
                    ),

                    ///// second row
                    Column(
                      children: [
                        spacer_2x,
                        Text('상세 정보'),
                        Text('등록일: 2021. 10. 01\n마지막 스타일러 가동일: 2021. 10. 07 '),
                        Image.asset('assets/images/sample_clothes.png', width: MediaQuery.of(context).size.width * 0.6,),
                        Text("카테고리: 상의 > 후드 티셔츠\n색상: 블루\n스타일링 코스: 선택 안함\n고급건조 코스: 표준건조\n살균: 표준살균"),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class Clothes {
  int id;
  String name;
  String category;
  int color;
  int subtype;
  String texture;
  bool isNeedStyler;
  String createdAt;
  String styleredAt;

  Clothes(this.id, this.name, this.category, this.color, this.subtype,
      this.texture, this.isNeedStyler, this.createdAt, this.styleredAt);
}
