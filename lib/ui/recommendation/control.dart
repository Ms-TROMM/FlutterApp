import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/theme/dimens.dart';

class ControlRecommendPage extends StatefulWidget {
  const ControlRecommendPage({Key? key}) : super(key: key);

  @override
  _ControlRecommendPageState createState() => _ControlRecommendPageState();
}

class _ControlRecommendPageState extends State<ControlRecommendPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24),
            child: _getRecommendText("김엘지"),
          ),
          Container(
            child: _getRecommendList(),
          )
        ],
      ),
    );
  }

  _getRecommendText(String name) {
    return Text(
      '$name님 안녕하세요!\n현재 집 안 온도는 22℃로 유지되고 있습니다. 스타일러 내에 정장이 있습니다. 고급의류 코스를 추천합니다!',
      style: const TextStyle(
          fontSize: MyDimens.FontSize_ExtraMedium, fontWeight: FontWeight.w500),
    );
  }

  _getRecommendList() {
    final List<String> entries = <String>['고급의류\n코스 실행', '섬세건조\n코스 실행', '스팀살균\n코스 실행'];
    final List<int> colorCodes = <int>[200, 400, 600];
    final List<String> imagePaths = <String>['top.png', 'bottom.png', 'mint.png'];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blue[colorCodes[index]]),
          height: 100,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: const EdgeInsets.all(8), child: Image.asset('assets/images/${imagePaths[index]}')),
                  Text(entries[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MyDimens.FontSize_Large,
                          color: Colors.white)),
                ],
              )),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
