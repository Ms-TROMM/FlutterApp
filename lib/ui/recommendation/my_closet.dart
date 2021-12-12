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

  List<String> colors = ['블랙', '블랙', '블랙', '블루'];
  List<String> images = [
    'assets/images/sample_clothes3.png',
    'assets/images/sample_clothes8.png',
    'assets/images/sample_clothes5.png',
    'assets/images/sample_clothes9.png'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _asyncMethod();
    });

    userClothesFuture = apiService.fetchUserClothes(1);
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
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ]),
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
                                  Text(
                                    snapshot.data![index].name,
                                    textAlign: TextAlign.center,
                                  )
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
                                spacer,
                                Image.asset(
                                  images[index],
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                ),
                                spacer,
                                Text(
                                  "✅ 카테고리: ${getCategoryText(snapshot.data![index].clothe_type)} > "
                                  "${getSubTypeText(snapshot.data![index].sub_type)}\n✅ 색상: ${colors[index % 4]}\n✅ 소재: ${snapshot.data![index].texture}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )
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
      t = '티셔츠';
    } else if (sub_type == 2) {
      t = '셔츠';
    } else if (sub_type == 3) {
      t = '블레이저';
    } else if (sub_type == 4) {
      t = '추리닝 바지';
    } else {
      t = '청자켓';
    }
    return t;
  }
}
