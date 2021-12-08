import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/recommendation/add_clothes_page2.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AddClothesPage1 extends StatefulWidget {
  final CameraDescription camera;

  const AddClothesPage1({Key? key, required this.camera}) : super(key: key);

  @override
  _AddClothesPage1State createState() => _AddClothesPage1State();
}

class _AddClothesPage1State extends State<AddClothesPage1> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // 카메라의 현재 출력물을 보여주기 위해
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // 위젯의 생명주기 종료시 컨트롤러 역시 해제시켜줍니다.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 옷 등록하기 (1/2)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt_outlined),
        onPressed: () async {
          // try / catch 블럭에서 사진을 촬영합니다. 만약 뭔가 잘못된다면 에러에
          // 대응할 수 있습니다.
          try {
            // 카메라 초기화가 완료됐는지 확인합니다.
            await _initializeControllerFuture;

            // path 패키지를 사용하여 이미지가 저장될 경로를 지정합니다.
            final path = join(
              // 본 예제에서는 임시 디렉토리에 이미지를 저장합니다. `path_provider`
              // 플러그인을 사용하여 임시 디렉토리를 찾으세요.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            XFile picture = await _controller.takePicture();
            picture.saveTo(path);
            print("path to pic : ${picture.path}");

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddClothesPage2(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: picture.path,
                ),
              ),
            );

          } catch (e) {
            // 만약 에러가 발생하면, 콘솔에 에러 로그를 남깁니다.
            print(e);
          }
        },
      ),
    );
  }
}
