import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/api/service.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';

import 'add_clothes_page1.dart';

class MyClosetPage extends StatefulWidget {
  const MyClosetPage({Key? key}) : super(key: key);

  @override
  _MyClosetPageState createState() => _MyClosetPageState();
}

class _MyClosetPageState extends State<MyClosetPage> {
  late Future<List<UserClothes>> userClothesFuture;
  late List<CameraDescription> cameras;
  late CameraDescription firstCamera;

  List<String> colors = ['흰색', '빨강색', '갈색', '파랑색'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });

    userClothesFuture = apiService.fetchUserClothes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('내 옷장'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_a_photo),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddClothesPage1(
                              camera: firstCamera,
                            )));
              },
            )
          ],
        ),
        body: FutureBuilder<List<UserClothes>>(
            future: userClothesFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            ////// first row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  snapshot.data![index].need_styler == 1
                                      ? 'assets/images/icon_map_clothing_store.png'
                                      : 'assets/images/icon_map_clothing_store_grey.png',
                                  width: 48,
                                ),
                                Column(children: [
                                  getNeedStylerText(
                                      snapshot.data![index].need_styler),
                                  Text(snapshot.data![index].name, textAlign: TextAlign.center,)
                                ]),
                                Image.asset(
                                  snapshot.data![index].is_inside_styler == 0
                                      ? 'assets/images/icon_feather_bookmark.png'
                                      : 'assets/images/icon_feather_bookmark_blue.png',
                                  width: 24,
                                ),
                              ],
                            ),

                            ///// second row
                            Column(
                              children: [
                                spacer_2x,
                                const Text('상세 정보',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  '등록일: ${snapshot.data![index].created_at}\n마지막 스타일러 가동일: ${snapshot.data![index].stylered_at}',
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset(
                                  index % 2 == 0
                                      ? 'assets/images/sample_clothes.png'
                                      : 'assets/images/sample_clothes_2.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                ),
                                Text(
                                  "✅ 카테고리: ${getCategoryText(snapshot.data![index].clothe_type)} > "
                                  "${getSubTypeText(snapshot.data![index].sub_type)}\n👨‍🎨 색상: ${colors[index % 4]}\n",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const Text("• 스타일링 코스: 선택 안함\n• 고급건조 코스: 표준건조\n• 살균: 표준살균",
                                textAlign: TextAlign.center,)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(child: const CircularProgressIndicator());
            }));
  }

  void _asyncMethod() async {
    // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
    cameras = await availableCameras();

    // 이용가능한 카메라 목록에서 특정 카메라를 얻습니다.
    firstCamera = cameras.first;
  }

  getNeedStylerText(int need) {
    String t = '';
    if (need == 0) {
      t = "스타일러가 필요해요 😄";
    } else if (need == 1) {
      t = '스타일러 어떨까요? 😉';
    } else {
      t = '이 옷은 괜찮아요 😶';
    }
    return Text(t, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
  }

  getCategoryText(String text) {
    String t = '';
    if (text == "onepiece") {
      t = "원피스";
    } else if (text == "top") {
      t = "상의";
    } else {
      t = "하의";
    }

    return t;
  }

  getSubTypeText(int sub_type) {
    String t = '';
    if (sub_type == 1) {
      t = '후드티';
    } else {
      t = '와이셔츠';
    }
    return t;
  }
//
// getDateTimeString(String date) {
//
//   return
// }

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
